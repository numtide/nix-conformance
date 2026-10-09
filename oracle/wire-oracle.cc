// The worker-protocol reference of nix-conformance: Nix 2.34.8's daemon
// client (RemoteStore) against a daemon at a Unix socket, one operation per
// request, answered in the line form of SPEC.md.
//
//   wire-oracle SOCKET OP ARG...   one operation, one line on stdout
//   wire-oracle                    a server for fuzzers: requests are u32
//                                  length and the line `SOCKET OP ARG...`,
//                                  replies u32 length and the answer
//
// Ops: connect, path-info PATH, valid-paths PATH..., missing DERIVED...,
// output-map DRV, substitutable PATH...

#include <nix/store/content-address.hh>
#include <nix/store/derived-path.hh>
#include <nix/store/globals.hh>
#include <nix/store/path-info.hh>
#include <nix/store/store-api.hh>
#include <nix/store/store-open.hh>
#include <nix/util/util.hh>

#include <iostream>
#include <sstream>
#include <string>
#include <unistd.h>
#include <vector>

using namespace nix;

namespace {

std::string join(const std::vector<std::string> & v)
{
    std::string o;
    for (auto & s : v)
        o += (o.empty() ? "" : ",") + s;
    return o;
}

std::string paths(Store & store, const StorePathSet & ps)
{
    std::vector<std::string> v;
    for (auto & p : ps)
        v.push_back(store.printStorePath(p));
    std::sort(v.begin(), v.end());
    return join(v);
}

std::string answer(const std::vector<std::string> & req)
{
    auto & sock = req.at(0);
    auto & op = req.at(1);
    std::vector<std::string> args(req.begin() + 2, req.end());
    auto store = openStore("unix://" + sock);
    auto parseAll = [&]() {
        StorePathSet s;
        for (auto & a : args)
            s.insert(store->parseStorePath(a));
        return s;
    };

    if (op == "connect") {
        auto t = store->isTrustedClient();
        return "ok minor=" + std::to_string(store->getProtocol() & 0xff) + " version=" + store->getVersion().value_or("")
               + " trusted=" + (t ? (*t == Trusted ? "yes" : "no") : "unknown");
    }
    if (op == "path-info") {
        std::shared_ptr<const ValidPathInfo> info;
        try {
            info = store->queryPathInfo(store->parseStorePath(args.at(0))).get_ptr();
        } catch (InvalidPath &) {
            return "none";
        }
        std::vector<std::string> sigs;
        for (auto & s : info->sigs)
            sigs.push_back(s.to_string());
        std::sort(sigs.begin(), sigs.end());
        return "info deriver=" + (info->deriver ? store->printStorePath(*info->deriver) : "")
               + " nar=" + info->narHash.to_string(HashFormat::Base16, false) + " refs="
               + paths(*store, info->references) + " time=" + std::to_string(info->registrationTime)
               + " size=" + std::to_string(info->narSize) + " ultimate=" + (info->ultimate ? "1" : "0")
               + " sigs=" + join(sigs) + " ca=" + (info->ca ? renderContentAddress(info->ca) : "");
    }
    if (op == "valid-paths")
        return "paths " + paths(*store, store->queryValidPaths(parseAll()));
    if (op == "missing") {
        std::vector<DerivedPath> targets;
        for (auto & a : args)
            targets.push_back(DerivedPath::parseLegacy(*store, a));
        auto m = store->queryMissing(targets);
        return "missing build=" + paths(*store, m.willBuild) + " subst=" + paths(*store, m.willSubstitute)
               + " unknown=" + paths(*store, m.unknown) + " download=" + std::to_string(m.downloadSize)
               + " nar=" + std::to_string(m.narSize);
    }
    if (op == "output-map") {
        std::vector<std::string> v;
        for (auto & [name, path] : store->queryPartialDerivationOutputMap(store->parseStorePath(args.at(0))))
            v.push_back(name + "=" + (path ? store->printStorePath(*path) : "-"));
        std::sort(v.begin(), v.end());
        return "outputs " + join(v);
    }
    if (op == "substitutable") {
        StorePathCAMap want;
        for (auto & p : parseAll())
            want.emplace(p, std::nullopt);
        SubstitutablePathInfos infos;
        store->querySubstitutablePathInfos(want, infos);
        StorePathSet have;
        for (auto & [p, _] : infos)
            have.insert(p);
        return "subst " + paths(*store, have);
    }
    return "unsupported";
}

std::string safely(const std::vector<std::string> & req)
{
    try {
        return answer(req);
    } catch (std::exception & e) {
        // the reason, for a human who replays a case; the answer is the line
        std::cerr << e.what() << "\n";
        return "error";
    }
}

std::vector<std::string> words(const std::string & line)
{
    std::istringstream in(line);
    std::vector<std::string> v;
    for (std::string w; in >> w;)
        v.push_back(w);
    return v;
}

bool readAll(void * buf, size_t n)
{
    auto p = (char *) buf;
    while (n) {
        auto r = read(0, p, n);
        if (r <= 0)
            return false;
        p += r;
        n -= r;
    }
    return true;
}

void writeAll(const void * buf, size_t n)
{
    auto p = (const char *) buf;
    while (n) {
        auto r = write(1, p, n);
        if (r <= 0)
            _exit(1);
        p += r;
        n -= r;
    }
}

} // namespace

int main(int argc, char ** argv)
{
    initLibStore(false);
    if (argc > 1) {
        std::cout << safely(std::vector<std::string>(argv + 1, argv + argc)) << "\n";
        return 0;
    }
    std::string line;
    while (true) {
        uint32_t len;
        if (!readAll(&len, 4))
            return 0;
        line.resize(len);
        if (!readAll(line.data(), len))
            return 0;
        auto a = safely(words(line));
        uint32_t n = a.size();
        writeAll(&n, 4);
        writeAll(a.data(), n);
    }
}
