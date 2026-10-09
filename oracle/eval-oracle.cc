// The evaluation reference of nix-conformance: Nix 2.34.8's evaluator in
// pure mode, printing the value as `nix-instantiate --eval --strict` does.
//
//   eval-oracle FILE...   one line per file: `ok VALUE` or `error`
//   eval-oracle           a server for fuzzers: frames on stdin and stdout
//
// Server frames: request u32 length (little endian), then the source.
// Reply u8 kind (0 value, 1 error, 2 error after which the server exits),
// u32 length, then the value or the error message. Kind 2 is a stack
// overflow: `nix-instantiate` stops with an error there and cannot go on
// either (detectStackOverflow, src/libmain/unix/stack.cc).

#include <nix/expr/eval.hh>
#include <nix/expr/eval-gc.hh>
#include <nix/expr/eval-settings.hh>
#include <nix/expr/print-ambiguous.hh>
#include <nix/fetchers/fetch-settings.hh>
#include <nix/main/shared.hh>
#include <nix/store/globals.hh>
#include <nix/store/store-open.hh>
#include <nix/util/configuration.hh>
#include <nix/util/current-process.hh>
#include <nix/util/file-system.hh>
#include <nix/util/util.hh>

#include <iostream>
#include <sstream>
#include <string>
#include <unistd.h>

using namespace nix;

namespace {

struct Evaluator
{
    std::unique_ptr<AutoDelete> root;
    std::shared_ptr<Store> store;
    fetchers::Settings fetchSettings;
    EvalSettings evalSettings{settings.readOnlyMode};
    std::shared_ptr<EvalState> state;
    size_t served = 0;

    // A real store, in a directory of its own: `derivation` writes its .drv
    // there as `nix-instantiate` does, and a string with a drvPath's context
    // takes the .drv's closure from it. `dummy://?read-only=false` gives a
    // .drv no references (dummy-store.cc, queryPathInfoUncached), so that
    // closure, and the drvPath, would be wrong.
    void fresh()
    {
        state.reset();
        store.reset();
        root = std::make_unique<AutoDelete>(createTempDir("", "eval-oracle"));
        store = openStore("local?root=" + root->path().string()).get_ptr();
        state = std::make_shared<EvalState>(LookupPath{}, ref{store}, fetchSettings, evalSettings);
    }

    Evaluator()
    {
        evalSettings.pureEval = true;
    }

    struct Answer
    {
        bool ok;
        std::string text;
    };

    // SPEC.md: the expression is evaluated as a string in /case
    Answer eval(const std::string & input)
    {
        // a fresh state and store now and then: both only grow
        if (!state || served++ % 1024 == 0)
            fresh();
        try {
            auto e = state->parseExprFromString(input, state->rootPath(CanonPath("/case")));
            Value v;
            state->eval(e, v);
            state->forceValueDeep(v);
            std::ostringstream out;
            std::set<const void *> seen;
            printAmbiguous(*state, v, out, &seen);
            return {true, out.str()};
        } catch (Error & err) {
            return {false, err.msg()};
        } catch (std::exception & e) {
            // nlohmann's JSON errors, of `__structuredAttrs` for one:
            // `nix-instantiate` reports them as errors too (handleExceptions)
            return {false, e.what()};
        }
    }
};

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

bool serving = false;

void overflow(siginfo_t *, void *)
{
    static const char frame[] = "\x02\x0e\x00\x00\x00stack overflow";
    static const char line[] = "error\n";
    if (serving)
        writeAll(frame, sizeof frame - 1);
    else
        writeAll(line, sizeof line - 1);
    _exit(1);
}

void serve(Evaluator & ev)
{
    serving = true;
    std::string input;
    while (true) {
        uint32_t len;
        if (!readAll(&len, 4))
            return;
        input.resize(len);
        if (!readAll(input.data(), len))
            return;
        auto a = ev.eval(input);
        uint8_t kind = a.ok ? 0 : 1;
        uint32_t n = a.text.size();
        writeAll(&kind, 1);
        writeAll(&n, 4);
        writeAll(a.text.data(), n);
    }
}

} // namespace

int main(int argc, char ** argv)
{
    setenv("HOME", "/home/case", 1);
    // the evaluator recurses: the stack nix's own main asks for (src/nix/main.cc)
    setStackSize(60 * 1024 * 1024);
    initLibUtil();
    initLibStore(false);
    initGC();
    settings.readOnlyMode = false;
    // SPEC.md: the drvPaths of content-addressed derivations are compared too
    experimentalFeatureSettings.set("extra-experimental-features", "ca-derivations");
    detectStackOverflow();
    stackOverflowHandler = overflow;
    Evaluator ev;
    if (argc == 1) {
        serve(ev);
        return 0;
    }
    for (int i = 1; i < argc; i++) {
        auto a = ev.eval(readFile(std::filesystem::path(argv[i])));
        // the reason, for a human who replays a case; the answer is the line
        if (!a.ok)
            std::cerr << a.text << "\n";
        std::cout << (a.ok ? "ok " + a.text : "error") << "\n";
    }
    return 0;
}
