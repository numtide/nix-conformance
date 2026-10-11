// The derivation reference of nix-conformance: Nix 2.34.8's `.drv` reader
// and writer, with the experimental features ca-derivations,
// dynamic-derivations, impure-derivations and git-hashing on.
//
//   drv-oracle FILE...   one line per file: `ok DRVPATH SHA256` or `error`
//   drv-oracle           a server for fuzzers: frames on stdin and stdout
//
// A file names its derivation as SPEC.md says; a frame names it `x`.
// Server frames: request u32 length, the ATerm. Reply u8 kind (0 done,
// 1 error), u32 length, then the drvPath, a NUL and the ATerm written
// again, or for an error the message.

#if __has_include(<nix/store/derivation/aterm.hh>)
#  include <nix/store/derivation/aterm.hh>
#endif
#include <nix/store/derivations.hh>
#include <nix/store/globals.hh>
#include <nix/store/store-api.hh>
#include <nix/store/store-open.hh>
#include <nix/util/file-system.hh>
#include <nix/util/hash.hh>
#include <nix/util/terminal.hh>
#include <nix/util/util.hh>

#include <cstdint>
#include <iostream>
#include <string>
#include <unistd.h>

using namespace nix;

namespace {

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

void reply(uint8_t kind, const std::string & payload)
{
    uint32_t len = payload.size();
    writeAll(&kind, 1);
    writeAll(&len, 4);
    writeAll(payload.data(), len);
}

std::string nameOf(std::string_view file)
{
    auto name = baseNameOf(file);
    if (name.ends_with(".drv"))
        name.remove_suffix(4);
    if (name.size() > 33 && name[32] == '-')
        name.remove_prefix(33);
    return std::string(name);
}

std::pair<std::string, std::string> roundTrip(Store & store, std::string aterm, std::string_view name)
{
#if __has_include(<nix/store/derivation/aterm.hh>)
    // Nix after 2.34 moved the ATerm functions; this keeps one source for both.
    auto drv = derivation::parse(store, std::move(aterm), name);
    return {store.printStorePath(computeStorePath(store, drv)), derivation::unparse(drv, store)};
#else
    auto drv = parseDerivation(store, std::move(aterm), name);
    return {store.printStorePath(computeStorePath(store, drv)), drv.unparse(store, false)};
#endif
}

} // namespace

int main(int argc, char ** argv)
{
    initLibStore(false);
    experimentalFeatureSettings.set("experimental-features", "ca-derivations dynamic-derivations impure-derivations git-hashing");
    auto store = openStore("dummy://");
    if (argc > 1) {
        for (int i = 1; i < argc; i++) {
            try {
                auto [path, out] = roundTrip(*store, readFile(argv[i]), nameOf(argv[i]));
                std::cout << "ok " << path << " " << hashString(HashAlgorithm::SHA256, out).to_string(HashFormat::Base16, false)
                          << "\n";
            } catch (std::exception &) {
                std::cout << "error\n";
            }
        }
        return 0;
    }
    std::string in;
    while (true) {
        uint32_t len;
        if (!readAll(&len, 4))
            return 0;
        in.resize(len);
        if (!readAll(in.data(), len))
            return 0;
        try {
            auto [path, out] = roundTrip(*store, in, "x");
            reply(0, path + '\0' + out);
        } catch (std::exception & e) {
            reply(1, filterANSIEscapes(e.what(), true));
        }
    }
}
