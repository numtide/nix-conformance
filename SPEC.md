# The answers

Each answer is what Nix 2.34.8 gives. Where this text and the reference
disagree, the reference is right and this text has a bug.

## `parse`

The input is parsed as the file `/case/input.nix`, with `$HOME` set to
`/home/case`, the experimental feature `pipe-operators` on, and no check of
scope: an undefined variable is not an error here (`check` tests scope).

A refusal is `error LINE:COL`: the position of Nix's error. Lines end at
`\n`, at `\r\n` and at a lone `\r`; the column counts bytes from 1. The
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

Strings are quoted with `"`; `"` and `\` are escaped with `\`, and each
byte outside 0x20–0x7e is written `\xHH`.

The desugaring follows Nix exactly, including its odd corners:

- `a.b = 1; a.c = 2;` and `a = { b = 1; }; a.c = 2;` merge into one set
  (`ParserState::addAttr`); the `rec` of a set merged into another is
  dropped.
- Applying a call extends it (`makeCall`): `(f a) b` is `(call F A B)`,
  and so is `(a - b) c` as `(call (var "__sub") A B C)`. The one exception
  is `e or`, which is `(call E (var "or"))` and is extended by what
  follows: `e or x` is `(call E (var "or") X)`.
- `${e}` names a static attribute when `e` is one string node:
  `${"a"}` and `${''a''}` are `"a"`; `${''a''$b''}` is dynamic, because
  the escape is a token of its own.

Three rules make the tree independent of how a parser stores it:

1. The `bind`s of an `attrs` are sorted by name, as bytes; the `dyn-bind`s
   keep their order after them. The `formal`s of a lambda are sorted by
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
bytes the NAR took (bytes after it are not read), and the SHA-256, in
lowercase hexadecimal, of the tree written out again as a NAR. For a
well-formed NAR that is the hash of its own bytes.

## `lang/`

The conventions of Nix's own test runner, `tests/functional/lang.sh`:

- `eval-okay-NAME.nix`: the output of `eval` must be `NAME.exp`; with
  `NAME.exp.xml`, the output of `eval-xml` must be it. `NAME.exp-disabled`
  disables the case. `NAME.flags` holds `nix-instantiate` flags.
- `eval-fail-NAME.nix`: `eval` must fail. The text of the error
  (`NAME.err.exp`) is Nix's and is not compared.
- `parse-okay-NAME.nix`, `parse-fail-NAME.nix`: `check` must accept or
  refuse. A refusal includes an undefined variable. `NAME.exp` holds
  Nix's own printing of the tree and is not compared.

## `wire`

Not run by `run` yet: the worker-protocol reference is `wire-oracle`, which
the fuzzers of iets drive. It is Nix 2.34.8's `RemoteStore` against a
daemon at a Unix socket, one operation per request. The answer is one line:

| Operation | Answer |
|:---|:---|
| `connect` | `ok minor=M version=V trusted=yes\|no\|unknown` |
| `path-info PATH` | `none`, or `info deriver=D nar=H refs=R time=T size=S ultimate=0\|1 sigs=G ca=C` |
| `valid-paths PATH...` | `paths P` |
| `missing DERIVED...` | `missing build=B subst=S unknown=U download=N nar=N` |
| `output-map DRV` | `outputs NAME=PATH\|-,...` |
| `substitutable PATH...` | `subst P` |

A list is sorted and joined with `,`. `nar` is base16 without the
algorithm. Any reply the client refuses is `error`.
