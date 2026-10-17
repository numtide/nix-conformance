# Coverage: what this suite does not test yet

This file compares the suite with the tests of Nix itself. It lists the
gaps, ranks them by the bugs they would catch, and gives the cost of each.

Sources: NixOS/nix at tag `2.34.8` (the reference) and at master
`81da9300c` (newer tests and the newer protocol documents). Paths below
are in that tree unless they start with this repository's layout.

## The rule for every gap

A case tests what is specified, and ignores how Nix words it. `parse/`
shows the form: it expects `error LINE:COL` and no message. Each gap below says how
its answer stays free of Nix's prose. An implementation can word an error
differently, and the suite must accept that.

## What NixOS/nix tests

| Area | Size | Can this suite own it? |
|:---|:---|:---|
| `tests/functional/lang` | 492 `.nix` at 2.34.8, 672 at master | Yes. All 492 are in `lang/`. The `.err.exp` messages are not: an `eval-fail-*` case only has to fail. |
| `src/libstore-tests/data/derivation` | 47 files at 2.34.8 (14 `.drv`), 76 at master: ATerm and JSON forms, masked hashes (`hashDerivationModulo`), `try-resolve` | Yes, the ATerm and the hashes. The JSON form is Nix's own format. |
| `src/libstore-tests/data/{worker,serve,common}-protocol` | 58, 45, 20 `.bin`/`.json` pairs, one per protocol version | Yes, the bytes. Only for an implementation that speaks the protocol. |
| `src/libstore-tests` `path.cc`, `content-address.cc`, `outputs-spec.cc`, `derived-path.cc`, `nar-info.cc` | 58, 7, 61, 20, 37 tests | Partly: store path names and content addresses, through evaluation. The parsers of Nix's CLI syntax are not specified. |
| `src/libutil-tests` `data/nars`, `tests/functional/*.nar` | 12 and 4 NARs: `dotdot`, `nul-character`, padding, `case-collision` | Yes. None is in `nar/`. |
| `src/libutil-tests` `hash.cc`, `git.cc`, `file-content-address.cc` | 22, 15, 6 tests | Yes, through `builtins.hashString`, `convertHash` and `builtins.path`. |
| `src/libexpr-tests` `value/context.cc`, `primops.cc` | 11, 114 tests | Yes, the semantics, through `lang/`. Not the C++ API. |
| `src/libflake-tests` `flakeref.cc` | 7 tests | Yes. `lang/` has 9 `parseFlakeRef` cases. |
| `tests/functional/ca` | 35 files | Evaluation and resolution only. Building is out. |
| `tests/functional/dyn-drv` | 21 files | `outputOf` and the `.drv` form only. Building is out. |
| `tests/functional/flakes` | 38 scripts, among them `follow-paths.sh`, `relative-paths-lockfile.sh`, `old-lockfiles.sh` | Lock resolution, with local inputs only. |
| `tests/functional/cli-characterisation` | 126 files | No. The `.err.exp` files are Nix's messages. The exit codes and stdout could be owned. |
| `tests/functional` other scripts (about 190) | build, gc, sandbox, remote builds, binary caches, profiles, repl, logging, fetchers | No. They test Nix's implementation, not a specification. |
| `tests/nixos` | 30 VM tests: remote builds, S3, containers, setuid | No. |
| `src/*-tests/nix_api_*.cc`, benches, `error_traces.cc` | | No. The C API is Nix's, and traces are prose. |

What the suite has today is listed in `README.md`: `lang/`, `parse/`,
`nar/`, `drv/`, `flake/`, `wire/`, `corpus/` and `nix-bugs/`.

## The gaps, ranked

Rank is by the real bug a gap would catch. Cost is the work to add it.

### 1. A derivation target: `.drv` read, write and drvPath

**Built:** `drv/` and the `drv` op, with `lib.adapterFor` (#4).

**What it catches.** Since `69b449fe5`, Nix master reads the byte 0xFF
in an ATerm string as end of file (`nix-bugs/README.md`). Nix writes such
bytes, because `builtins.readFile` does not check them. One such `.drv`
in a store makes `nix store gc` fail for the whole store. The fix is
NixOS/nix#16580. All 6 real `.drv` files in `drv/` hold a 0xFF byte, and
Nix 2.36pre (`203f85b2`, `nixVersions.git`) refuses all 6. Building this
target found three more `.drv` bugs (`nix-bugs/`). It also catches
`nix-bugs/drv-round-trip`: Nix 2.34.8 writes a `"` in an input's output
name without its escape, and cannot read it back.

**Contents.** Each byte in each field that holds bytes (`drv/bytes/`),
the structural shapes (`drv/shape/`), the `.drv` files of
`src/libstore-tests/data/derivation` (`drv/upstream/`), and six real
files.

**Answer.** `ok DRVPATH SHA256` or `error`. DRVPATH and the hash of the
written bytes are facts, not prose.

**Canonical form.** The master document
`doc/manual/source/protocols/derivation-aterm.md` ("Canonical form")
gives one derivation one spelling. It rejects a literal newline in a
string, `\q`, unsorted or duplicate keys, an escape in the system, and
trailing bytes. Nix 2.34.8 accepts all of these. Unsorted keys and
trailing bytes give the drvPath of the canonical form, and the others
give a new drvPath. The reference and the specification disagree, so
these inputs are in `nix-bugs/drv-canonical/`, and the suite requires
neither acceptance nor refusal.

### 2. Output paths from evaluation

**Built:** `lang/eval-*-drv-*`, except a `text` output with another hash
than SHA-256, which crashes Nix (`nix-bugs/drv-text-hash`).

**What it catches.** A wrong output path gives a wrong cache hit or no
hit, and a store that differs from Nix's store. The class is real here:
`nix-bugs/dummy-store` shows Nix itself giving a wrong drvPath when the
closure of a `.drv` is wrong. Upstream checks paths only through fixed
fixtures. No unit test calls `makeFixedOutputPath` or `makeTextPath`.

**Contents**, as `lang/` cases that print `drvPath` and `outPath`:

- Fixed outputs: `outputHashMode` flat, recursive and text, with `sha1`,
  `sha256`, `sha512` (and `md5` where Nix accepts it), and the hash written
  as base 16, Nix32, base 64 and SRI. The path must not depend on the
  spelling.
- Masking (`hashDerivationModulo`): pairs of fixed-output derivations
  with the same output and another builder. The dependent's `outPath`
  must be the same for both. Mirrors `src/libstore-tests/derivation/masked.cc`.
- Several outputs and their order, `__structuredAttrs`,
  `__contentAddressed` (the `outPath` is a placeholder),
  `builtins.placeholder` and `builtins.outputOf`.
- `builtins.toFile` with and without references, `builtins.path` with a
  `sha256` and a filter, and invalid store path names (`path.cc`) as
  `eval-fail-*`.

**Answer.** The value. Store paths are facts. A refusal is a failure
without a message.

### 3. String context

**Built:** `lang/eval-*-context-*`.

**What it catches.** A string that loses its context gives a derivation
without an input. The build then fails in a sandbox, or worse, it works
and the garbage collector deletes a dependency later. A context that is
too large gives a different drvPath (gap 2).

**Contents.** `getContext` after each string builtin that keeps or drops
context (`substring`, `replaceStrings`, `concatStringsSep`, `toJSON`,
`toString`, `attrNames`, path interpolation), `appendContext`,
`unsafeDiscardStringContext`, `unsafeDiscardOutputDependency` and
`addDrvOutputDependencies` in both directions. Also the drvPath of a
derivation that takes each string, which shows that the context reached
`inputDrvs` and `inputSrcs`. Upstream has 5 `lang` cases and 11 unit
tests (`value/context.cc`).

**Answer.** The value of `getContext`, and drvPaths.

### 4. Imports of upstream fixtures

**Built:** `drv/upstream/` and `nar/upstream/`. The `flakeref.cc` cases
are not imported yet.

**What it catches.** Edge cases that Nix developers picked by hand: the
NARs `dotdot`, `slash`, `nul-character`, padding, truncation and
`case-collision`, the 14 `.drv` files, and the cases of `flakeref.cc`.

**Answer.** The forms that `nar/` and `lang/` use now.

### 5. The worker protocol

**What it catches.** A client or a daemon that another implementation
cannot talk to, for one protocol version. `nix-bugs/daemon-client` holds
four replies that crash Nix's own client.

**Contents.** The serializers, from the `.bin` fixtures of
`src/libstore-tests/data/{worker,serve,common}-protocol`, the handshake
for each version, and the replies of `daemon-client`, where the expected
answer is "no crash".

**Answer.** Bytes, and `ok` or `error` for robustness. The JSON beside
each `.bin` is Nix's own form. Use the schemas in
`doc/manual/source/protocols/json` as the input form, or a new form of
this suite.

**Cost.** Medium to large: an op per value type and version, and a mock
daemon in `run`. `wire-oracle` exists. It is only of use to an
implementation that speaks the protocol.

**Built: the client side.** `wire/` has 80 scripted daemons, run through
the answers of `wire-oracle`: the handshake from 1.17 to 1.40, and right
and wrong replies to each operation of SPEC.md. The upstream `.bin`
fixtures are not used, because each holds one value and the cases cover
the same fields. The daemon side is not tested, and neither are the
`daemon-client` replies that crash Nix. `wire-oracle` does not
build against Nix master, so a master run skips these cases.

### 6. Content-addressed resolution

**What it catches.** A resolved derivation with another drvPath, so a CA
build misses its cache.

**Contents.** A `.drv` plus a build trace in, the resolved `.drv` out, as
`src/libstore-tests/data/derivation/try-resolve` does.

**Answer.** `ok DRVPATH SHA256` of the resolved derivation, as gap 1.

**Cost.** Medium. It is a pure function, but `ca-derivations` is
experimental and its forms still change on master.

### 7. Flake lock resolution and `follows`

**What it catches.** A lock file that picks other inputs, so the same
flake builds other things. Upstream has `follow-paths.sh`,
`relative-paths-lockfile.sh` and `old-lockfiles.sh` for this.

**Contents.** A tree of flakes with `path:` inputs only, and the lock
file Nix writes, `follows` chains, relative paths, and old lock file
versions read and kept.

**Answer.** The lock file as JSON, compared as data, with `lastModified`
fixed by the case.

**Cost.** Large. It needs a fetcher op, `narHash` of each input, and a
JSON comparison in `run`. The lock file format is documented, the
resolution less so.

**Built: the read side.** `flake/` has 8 trees from `follow-paths.sh`
and `relative-paths-lockfile.sh`, read with their lock as it is, and 11
locks that must be refused (stale, incomplete, a `follows` cycle). The
answer is output `result` as JSON. Relative inputs have no `narHash` or
`lastModified`, so no fetcher op is needed. Writing
a lock file is not tested. Its first run found that iets evaluated a stale lock and accepted an
input with both a url and a `follows`.

### 8. Command-line results

**What it catches.** A different exit code or stdout from `nix-build`,
`nix-instantiate` or `nix eval` for the same input.

**Contents.** The exit code class and stdout only. Never stderr.

**Answer.** Exit code 0, 1, or 100 (a build failure), and stdout as bytes.

**Cost.** Medium. Most of it is already owned through `eval` and
`eval-xml`. An `eval-json` op is the useful next step. Do not import
`cli-characterisation`, which holds Nix's messages.

### 9. Tests added after 2.34.8

Master has 180 more `.nix` files in `tests/functional/lang`, most of
them `eval-fail-*` type errors of builtins. Import them when the
reference moves. They catch little that is new.

## Recommendation

Gaps 1 to 4, the client side of gap 5 and the read side of gap 7 are
built. Next, by the same measure:

- The masked hash (`hashDerivationModulo`) as an answer of its own. The
  `drv` op checks the bytes and the drvPath, and `eval-okay-drv-masking`
  checks the masking only through output paths. Upstream has fixtures
  (`src/libstore-tests/data/derivation/masked`).
- `wire-oracle` for Nix master, so a master run covers `wire/`.
- An occasional run of Nix master through `lib.adapterFor
  nixVersions.git`. It caught `69b449fe5` before a release.
