// The parse reference of nix-conformance: Nix 2.34.8's parser, printing the
// tree in the canonical form of SPEC.md.
//
//   parse-oracle FILE...   one line per file: `ok TREE` or `error LINE:COL`
//   parse-oracle           a server for fuzzers: frames on stdin and stdout
//
// Server frames: request u32 length (little endian), then the source.
// Reply u8 kind (0 parsed, 1 error), u32 line, u32 column, u32 length, then
// the tree or the error message.

#include <nix/expr/eval.hh>
#include <nix/expr/eval-gc.hh>
#include <nix/expr/eval-settings.hh>
#include <nix/expr/nixexpr.hh>
#include <nix/fetchers/fetch-settings.hh>
#include <nix/store/globals.hh>
#include <nix/store/store-open.hh>
#include <nix/util/config-global.hh>
#include <nix/util/current-process.hh>
#include <nix/util/experimental-features.hh>
#include <nix/util/file-system.hh>
#include <nix/util/memory-source-accessor.hh>
#include <nix/util/terminal.hh>
#include <nix/util/util.hh>

#include <algorithm>
#include <bit>
#include <cstdio>
#include <iostream>
#include <sstream>
#include <string>
#include <unistd.h>

using namespace nix;

namespace {

const SymbolTable * syms;

std::string quote(std::string_view s)
{
    std::string o = "\"";
    for (unsigned char c : s) {
        if (c == '"' || c == '\\') {
            o += '\\';
            o += c;
        } else if (c < 0x20 || c >= 0x7f) {
            char buf[5];
            snprintf(buf, sizeof buf, "\\x%02x", c);
            o += buf;
        } else
            o += c;
    }
    return o + '"';
}

std::string name(Symbol s)
{
    return std::string((*syms)[s]);
}

std::string show(const Expr * e);

std::string floatLit(double f)
{
    char buf[40];
    snprintf(buf, sizeof buf, "(float %016llx)", (unsigned long long) std::bit_cast<uint64_t>(f));
    return buf;
}

std::string attrPath(std::span<const AttrName> path)
{
    std::string o = "(attrpath";
    for (auto & a : path)
        o += " " + (a.symbol ? quote(name(a.symbol)) : "(dyn " + show(a.expr) + ")");
    return o + ")";
}

std::string attrs(const ExprAttrs * a)
{
    std::vector<std::pair<std::string, std::string>> binds;
    for (auto & [s, d] : *a->attrs) {
        std::string v;
        switch (d.kind) {
        case ExprAttrs::AttrDef::Kind::Plain:
            v = show(d.e);
            break;
        case ExprAttrs::AttrDef::Kind::Inherited:
            v = "(inherit)";
            break;
        case ExprAttrs::AttrDef::Kind::InheritedFrom: {
            auto & sel = dynamic_cast<const ExprSelect &>(*d.e);
            auto & from = dynamic_cast<const ExprInheritFrom &>(*sel.e);
            v = "(inherit-from " + show((*a->inheritFromExprs)[from.displ]) + ")";
            break;
        }
        }
        binds.emplace_back(name(s), v);
    }
    std::sort(binds.begin(), binds.end());
    std::string o = a->recursive ? "(attrs rec" : "(attrs nonrec";
    for (auto & [n, v] : binds)
        o += " (bind " + quote(n) + " " + v + ")";
    for (auto & d : *a->dynamicAttrs)
        o += " (dyn-bind " + show(d.nameExpr) + " " + show(d.valueExpr) + ")";
    return o + ")";
}

std::string node(const char * tag, std::initializer_list<const Expr *> es)
{
    std::string o = std::string("(") + tag;
    for (auto e : es)
        o += " " + show(e);
    return o + ")";
}

// `(+ ...)` and `(interp ...)`: adjacent literals merge, wherever the lexer
// split them; an interpolation drops empty literals and is a plain string
// when nothing else is left.
std::string concat(const ExprConcatStrings * x)
{
    std::vector<std::string> parts;
    std::string run;
    bool inRun = false;
    auto flush = [&]() {
        if (inRun && !(x->forceString && run.empty()))
            parts.push_back("(str " + quote(run) + ")");
        run.clear();
        inRun = false;
    };
    bool onlyStrings = true;
    for (auto & [_, part] : x->es) {
        if (auto s = dynamic_cast<const ExprString *>(part)) {
            run += s->v.string_view();
            inRun = true;
        } else {
            flush();
            onlyStrings = false;
            parts.push_back(show(part));
        }
    }
    flush();
    if (x->forceString && onlyStrings)
        return parts.empty() ? "(str \"\")" : parts[0];
    std::string o = x->forceString ? "(interp" : "(+";
    for (auto & p : parts)
        o += " " + p;
    return o + ")";
}

// `-1` is a call of `__sub` on 0 and a literal: shown as the literal, from
// the inside out, so `- -1` is `(int 1)`.
std::string call(const ExprCall * x)
{
    auto & args = *x->args;
    size_t skip = 0;
    std::string head;
    auto f = dynamic_cast<const ExprVar *>(x->fun);
    auto zero = args.size() >= 2 ? dynamic_cast<const ExprInt *>(args[0]) : nullptr;
    if (f && name(f->name) == "__sub" && zero && zero->v.integer().value == 0) {
        auto lit = show(args[1]);
        if (lit.starts_with("(int ")) {
            auto n = std::stoll(lit.substr(5));
            head = "(int " + std::to_string((int64_t) (0ULL - (uint64_t) n)) + ")";
            skip = 2;
        } else if (lit.starts_with("(float ")) {
            auto bits = std::stoull(lit.substr(7), nullptr, 16);
            head = floatLit(0.0 - std::bit_cast<double>((uint64_t) bits));
            skip = 2;
        }
    }
    if (skip && args.size() == 2)
        return head;
    std::string o = "(call " + (skip ? head : show(x->fun));
    for (size_t i = skip; i < args.size(); i++)
        o += " " + show(args[i]);
    return o + ")";
}

std::string show(const Expr * e)
{
    if (auto x = dynamic_cast<const ExprInt *>(e))
        return "(int " + std::to_string(x->v.integer().value) + ")";
    if (auto x = dynamic_cast<const ExprFloat *>(e))
        return floatLit(x->v.fpoint());
    if (auto x = dynamic_cast<const ExprString *>(e))
        return "(str " + quote(x->v.string_view()) + ")";
    if (auto x = dynamic_cast<const ExprPath *>(e))
        return "(path " + quote(x->v.pathStrView()) + ")";
    if (auto x = dynamic_cast<const ExprVar *>(e))
        return "(var " + quote(name(x->name)) + ")";
    if (dynamic_cast<const ExprPos *>(e))
        return "(cur-pos)";
    if (auto x = dynamic_cast<const ExprSelect *>(e))
        return "(select " + show(x->e) + " " + attrPath(x->getAttrPath()) + (x->def ? " " + show(x->def) : "")
               + ")";
    if (auto x = dynamic_cast<const ExprOpHasAttr *>(e))
        return "(has " + show(x->e) + " " + attrPath(x->attrPath) + ")";
    if (auto x = dynamic_cast<const ExprAttrs *>(e))
        return attrs(x);
    if (auto x = dynamic_cast<const ExprList *>(e)) {
        std::string o = "(list";
        for (auto i : x->elems)
            o += " " + show(i);
        return o + ")";
    }
    if (auto x = dynamic_cast<const ExprLambda *>(e)) {
        std::string o = "(lambda " + (x->arg ? quote(name(x->arg)) : "_");
        if (auto f = x->getFormals()) {
            std::vector<std::pair<std::string, std::string>> fs;
            for (auto & i : f->formals)
                fs.emplace_back(name(i.name), i.def ? " " + show(i.def) : "");
            std::sort(fs.begin(), fs.end());
            o += " (formals";
            for (auto & [n, d] : fs)
                o += " (formal " + quote(n) + d + ")";
            o += f->ellipsis ? " ...)" : ")";
        } else
            o += " _";
        return o + " " + show(x->body) + ")";
    }
    if (auto x = dynamic_cast<const ExprCall *>(e))
        return call(x);
    if (auto x = dynamic_cast<const ExprLet *>(e))
        return "(let " + attrs(x->attrs) + " " + show(x->body) + ")";
    if (auto x = dynamic_cast<const ExprWith *>(e))
        return node("with", {x->attrs, x->body});
    if (auto x = dynamic_cast<const ExprIf *>(e))
        return node("if", {x->cond, x->then, x->else_});
    if (auto x = dynamic_cast<const ExprAssert *>(e))
        return node("assert", {x->cond, x->body});
    if (auto x = dynamic_cast<const ExprOpNot *>(e))
        return node("!", {x->e});
    if (auto x = dynamic_cast<const ExprOpEq *>(e))
        return node("==", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpNEq *>(e))
        return node("!=", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpAnd *>(e))
        return node("&&", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpOr *>(e))
        return node("||", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpImpl *>(e))
        return node("->", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpUpdate *>(e))
        return node("//", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprOpConcatLists *>(e))
        return node("++", {x->e1, x->e2});
    if (auto x = dynamic_cast<const ExprConcatStrings *>(e))
        return concat(x);
    return "(unknown)";
}

struct Parser
{
    bool readOnly = true;
    ref<Store> store;
    fetchers::Settings fetchSettings;
    EvalSettings evalSettings{readOnly};
    std::shared_ptr<EvalState> state;
    std::shared_ptr<StaticEnv> env;
    ref<MemorySourceAccessor> files = make_ref<MemorySourceAccessor>();
    size_t served = 0;

    Parser()
        : store(openStore("dummy://"))
    {
        evalSettings.pureEval = false;
    }

    struct Answer
    {
        bool ok;
        uint32_t line = 0, col = 0;
        std::string text;
    };

    // SPEC.md: the file is /case/input.nix, scope is not checked
    Answer parse(const std::string & input)
    {
        // a fresh state now and then: the expression arena only grows
        if (!state || served++ % 4096 == 0) {
            state = std::make_shared<EvalState>(LookupPath{}, store, fetchSettings, evalSettings);
            auto top = new ExprWith(noPos, new ExprAttrs(), new ExprAttrs());
            env = std::make_shared<StaticEnv>(top, state->staticBaseEnv);
            syms = &state->symbols;
        }
        try {
            // a file origin: for a string Nix finds lines in the text up to
            // its first NUL only (position.cc, Pos::getSource)
            auto file = files->addFile(CanonPath("/case/input.nix"), std::string(input));
            return {true, 0, 0, show(state->parseExprFromFile(file, env))};
        } catch (Error & err) {
            Answer a{false};
            if (auto pos = err.info().pos) {
                a.line = pos->line;
                a.col = pos->column;
            }
            a.text = filterANSIEscapes(err.info().msg.str(), true);
            return a;
        } catch (std::exception & err) {
            // not a nix::Error: nix-instantiate reports it as an error too
            return {false, 0, 0, err.what()};
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

void serve(Parser & p)
{
    std::string input;
    while (true) {
        uint32_t len;
        if (!readAll(&len, 4))
            return;
        input.resize(len);
        if (!readAll(input.data(), len))
            return;
        auto a = p.parse(input);
        uint8_t kind = a.ok ? 0 : 1;
        uint32_t n = a.text.size();
        writeAll(&kind, 1);
        writeAll(&a.line, 4);
        writeAll(&a.col, 4);
        writeAll(&n, 4);
        writeAll(a.text.data(), n);
    }
}

} // namespace

int main(int argc, char ** argv)
{
    setenv("HOME", "/home/case", 1);
    // the parser recurses: the stack nix's own main asks for (src/nix/main.cc)
    setStackSize(60 * 1024 * 1024);
    initLibUtil();
    initLibStore(false);
    initGC();
    experimentalFeatureSettings.set("experimental-features", "pipe-operators");
    settings.readOnlyMode = true;
    Parser p;
    if (argc == 1) {
        serve(p);
        return 0;
    }
    for (int i = 1; i < argc; i++) {
        auto a = p.parse(readFile(std::filesystem::path(argv[i])));
        if (a.ok)
            std::cout << "ok " << a.text << "\n";
        else
            std::cout << "error " << a.line << ":" << a.col << "\n";
    }
    return 0;
}
