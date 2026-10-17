# The answers

Each answer is what Nix 2.34.8 gives. Where this text and the reference
disagree, the reference wins and this text has a bug.

## `parse`

The input is parsed as the file `/case/input.nix`, with `$HOME` set to
`/home/case` and the experimental feature `pipe-operators` on. Scope is
not checked, so an undefined variable is no error here. `check` tests
scope.

A refusal is `error LINE:COL`, the position of Nix's error. Lines end at
`\n`, `\r\n` or a lone `\r`. The column counts bytes from 1. The
message is not part of the answer.

An acceptance is `ok TREE`. The tree is an S-expression of Nix's syntax
tree after `parser.y` desugared it:

| Source | Tree |
|:---|:---|
| `1` | `(int 1)` |
| `1.5` | `(float 3ff8000000000000)`: the IEEE 754 bits in hexadecimal |
| `"a"`, `''a''`, `http://x` | `(str "a")` |
| `./a`, `/a`, `~/a` | `(path "/case/a")`, `(path "/a")`, `(path "/home/case/a")` |
| `<a>` | `(call (var "__findFile") (var "__nixPath") (str "a"))` |
| `x` | `(var "x")` |
| `__curPos` | `(cur-pos)` |
| `e.a.${b} or d` | `(select E (attrpath "a" (dyn B)) D)` |
| `e ? a` | `(has E (attrpath "a"))` |
| `{ a.b = 1; inherit c; inherit (d) e; ${f} = 2; }` | `(attrs nonrec (bind "a" (attrs nonrec (bind "b" (int 1)))) (bind "c" (inherit)) (bind "e" (inherit-from D)) (dyn-bind F (int 2)))` |
| `rec { }` | `(attrs rec)` |
| `[ a b ]` | `(list A B)` |
| `x: b`, `{ a ? 1, ... } @ x: b` | `(lambda "x" _ B)`, `(lambda "x" (formals (formal "a" (int 1)) ...) B)` |
| `f a b` | `(call F A B)` |
| `let a = 1; in b` | `(let (attrs nonrec (bind "a" (int 1))) B)` |
| `with a; b`, `if c then t else e`, `assert c; b` | `(with A B)`, `(if C T E)`, `(assert C B)` |
| `!a` | `(! A)` |
| `a == b`, `!=`, `&&`, `\|\|`, `->`, `//`, `++` | `(== A B)` and so on |
| `a + b` | `(+ A B)` |
| `a - b`, `a * b`, `a / b` | `(call (var "__sub") A B)`, `__mul`, `__div` |
| `a < b`, `a > b` | `(call (var "__lessThan") A B)`, the same with `B A` |
| `a <= b`, `a >= b` | `(! (call (var "__lessThan") B A))`, `(! (call (var "__lessThan") A B))` |
| `-a` | `(call (var "__sub") (int 0) A)` |
| `"a${b}c"` | `(interp (str "a") B (str "c"))` |
| `./a/${b}` | `(+ (path "/case/a/") B)` |

Strings are quoted with `"`. `"` and `\` are escaped with `\`, and each
byte outside 0x20–0x7e is written `\xHH`.

The desugaring follows Nix exactly, odd corners included:

- `a.b = 1; a.c = 2;` and `a = { b = 1; }; a.c = 2;` merge into one set
  (`ParserState::addAttr`). The `rec` of a set merged into another is
  dropped.
- Applying a call extends it (`makeCall`): `(f a) b` is `(call F A B)`,
  and so is `(a - b) c` as `(call (var "__sub") A B C)`. The one exception
  is `e or`, which is `(call E (var "or"))` and is extended by what
  follows: `e or x` is `(call E (var "or") X)`.
- `${e}` names a static attribute when `e` is one string node:
  `${"a"}` and `${''a''}` are `"a"`. `${''a''$b''}` is dynamic, because
  the escape is a separate token.

Three rules make the tree independent of how a parser stores it:

1. The `bind`s of an `attrs` are sorted by name, as bytes. The `dyn-bind`s
   follow them in source order. The `formal`s of a lambda are sorted by
   name.
2. In `(+ ...)` and `(interp ...)`, adjacent `(str ...)` parts are joined.
   In `(interp ...)`, empty `(str "")` parts are dropped, and an
   `(interp ...)` of only strings is the one `(str ...)` they make.
3. `(call (var "__sub") (int 0) (int N))` is `(int -N)`, and the same for a
   float literal, from the inside out: `- -1` is `(int 1)`. With more
   arguments, the literal is the head of the call.

## `nar`

The input is read as a NAR, as `parseDump` does (`src/libutil/archive.cc`).
A refusal is `error`. An acceptance is `ok CONSUMED SHA256`: the number of
bytes the NAR took, and the SHA-256, in lowercase hexadecimal, of the tree
written out again as a NAR. Bytes after the NAR are not read. For a
well-formed NAR, SHA256 is the hash of its own bytes.

## `drv`

The input is a `.drv` file. It is read as a derivation with the
experimental features `ca-derivations`, `dynamic-derivations`,
`impure-derivations` and `git-hashing` on (`parseDerivation`,
`src/libstore/derivations.cc`). The derivation's name is the file name
without `.drv`, and without the 32 characters of a store path hash and
the `-` after them, when they are there: `abc…-hello.drv` and `hello.drv`
both name `hello`.

A refusal is `error`. An acceptance is `ok DRVPATH SHA256`: the store
path of the derivation, and the SHA-256, in lowercase hexadecimal, of the
ATerm written again (`Derivation::unparse`). Each case in `drv/` that Nix
accepts is in the form Nix writes, so SHA256 is the hash of the file
itself and the derivation must come back byte for byte. A file named by its
store path gives that path as DRVPATH.

Nix 2.34.8 also accepts spellings that the ATerm document of later Nix
forbids (`doc/manual/source/protocols/derivation-aterm.md`, "Canonical
form"). These are in `nix-bugs/drv-canonical/`, and an implementation
may accept or refuse them.

## `flake`

The input is `flake/CASE/flake.nix`. Its directory is a flake with a
`flake.lock`, and all its inputs are relative paths inside it. The answer
is output `result` of that flake, evaluated in pure mode, as JSON. That
is what `nix eval --json --no-update-lock-file path:DIR#result` prints,
without whitespace and with attribute names sorted.

The lock file is used as it is. A lock that Nix would have to change is
an error: a stale or missing entry, a `follows` that leads nowhere, a
cycle, an unknown version. The implementation must not relock or fetch
anything instead.

- `okay-CASE/`: the answer must be `flake/okay-CASE.exp`.
- `fail-CASE/`: `flake` must fail. The message is not compared.

A relative input's `outPath` is `…-source/./b` in Nix 2.34.8, with the
`./`. No case depends on that string.

## `lang/`

The conventions of Nix's own test runner, `tests/functional/lang.sh`:

- `eval-okay-NAME.nix`: the output of `eval` must be `NAME.exp`. With
  `NAME.exp.xml`, the output of `eval-xml` must match it. `NAME.exp-disabled`
  disables the case. `NAME.flags` holds `nix-instantiate` flags.
- `eval-fail-NAME.nix`: `eval` must fail. The text of the error
  (`NAME.err.exp`) is Nix's and is not compared.
- `parse-okay-NAME.nix`, `parse-fail-NAME.nix`: `check` must accept or
  refuse. An undefined variable counts as a refusal. `NAME.exp` holds
  Nix's own printing of the tree and is not compared.

A derivation's `drvPath` and `outPath` are those of a real store. A
string with a drvPath's context brings the closure of that `.drv` into
the derivation that takes it. The reference evaluates each case with its
own local store (`nix-bugs/dummy-store` explains why the dummy store
won't do). An implementation needs no store, only the same paths.
`eval-okay-drv-*` and `eval-okay-context-*` test this. Their system is
always `x86_64-linux`, so the answers are the same on every host.

## `wire`

A case is a daemon's side of one conversation: `wire/CASE.bin`, and for
an upload `wire/CASE.after`. `wire/ask` serves it on a Unix socket with
`wire-serve` and calls `ADAPTER wire SOCKET OP ARG...`, with `OP ARG...`
from `wire/CASE.op`. The adapter connects a client to SOCKET, runs the
operation and prints the answer. `wire-serve` sends `CASE.bin` to each
connection, then closes its write side. With `CASE.after`, it first reads
until the end of the upload of `add-multiple`: a frame of 8 bytes that
holds the count 0, then the empty frame. Then it sends `CASE.after`.

The reference is `wire-oracle`, which iets's fuzzers also drive. It runs
Nix 2.34.8's `RemoteStore` against a daemon at a Unix socket, one
operation per request. The answer is one line:

| Operation | Answer |
|:---|:---|
| `connect` | `ok minor=M version=V trusted=yes\|no\|unknown` |
| `path-info PATH` | `none`, or `info deriver=D nar=H refs=R time=T size=S ultimate=0\|1 sigs=G ca=C` |
| `valid-paths PATH...` | `paths P` |
| `missing DERIVED...` | `missing build=B subst=S unknown=U download=N nar=N` |
| `output-map DRV` | `outputs NAME=PATH\|-,...` |
| `substitutable PATH...` | `subst P` |
| `substitute PATH...` | `paths P`: `QueryValidPaths` with substitution on |
| `build DERIVED...` | `built`, then for each result a line `PATH status=S`, with ` msg=M` for a failure |
| `indirect-root PATH` | `ok` |
| `nar PATH` | `nar SIZE SHA256`: the NAR that `NarFromPath` sent |
| `add-multiple` | `ok`: `AddMultipleToStore` of no paths |

A list is sorted and joined with `,`. `nar` and `SHA256` are base16 without
the algorithm. In `build`, `PATH` is the derived path as Nix writes it
(`to_string_legacy`), `S` the wire value of the status
(`buildResultStatusTable`) and `M` the message as the daemon sent it. Any
reply the client refuses is `error`. Log lines and activities on stderr
are not part of the answer.

Nix's `unix://` store reads a NAR straight from the file system. `nar`
calls `RemoteStore::narFromPath`, as an `ssh-ng://` store does.

## `eval`

`run` does not use this op. The evaluation reference is `eval-oracle`,
which iets's fuzzers drive. The input is an expression, evaluated as a string
in `/case` in pure mode, with the experimental feature `ca-derivations`
on and a store of its own in a temporary directory
(`local?root=DIR`). A `derivation` writes its `.drv` there, as
`nix-instantiate` does, so a drvPath and the closure of a drvPath's
context are those of a real store. The value is forced deeply. The
answer is `ok VALUE`, with VALUE as `nix-instantiate --eval --strict`
prints it, `«repeated»` included, or `error` for any error, a JSON error
of `__structuredAttrs` included. The message is not part of the answer.

`==` on two sets compares their attributes in symbol order, the order in
which the evaluator first saw each name, and stops at the first
difference. So whether it reaches a differing or a failing attribute
first is not part of the language. The oracle keeps its symbols from one
expression to the next. A fuzzer that wants a stable answer for such an
expression names the attributes first, in a fixed order.
