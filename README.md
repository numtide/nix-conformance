# nix-conformance

A test suite for implementations of the Nix language and of the NAR
format. Every expected answer is the answer of Nix 2.34.8, and a check
keeps it so.

An implementation takes part through one small program, its *adapter*.
The runner gives the adapter one file at a time and compares what it
prints with the expected answer.

## Layout

| Path | What | Expected answer |
|:---|:---|:---|
| `lang/` | Nix's own language tests (`tests/functional/lang` of Nix 2.34.8), plus more cases in the same layout; `eval-*-regex-*` and `eval-*-fromTOML-*` take one entry each of `lang/corpora/`, except the two in `nix-bugs/regex-char-sign/` | `eval-okay-*.exp`, or failure for `eval-fail-*`; acceptance or refusal for `parse-*` |
| `parse/` | Nix source found by differential fuzzing | `FILE.exp`: `ok TREE` or `error LINE:COL` |
| `nar/` | NARs found by differential fuzzing | `FILE.exp`: `ok CONSUMED SHA256` or `error` |
| `corpus/parse/`, `corpus/nar/` | grown fuzz corpora: 3,665 sources, 258 NARs | none: compare with the reference (`--against`) |
| `nix-bugs/` | inputs on which Nix 2.34.8 itself fails, or answers differently by host | none; see `nix-bugs/README.md` |
| `drv/` | `.drv` files for a derivation target, not run yet | their names; see `drv/README.md` |
| `oracle/`, `adapters/nix` | the reference adapter | |

`SPEC.md` defines the answers: the tree form, the NAR line and the
conventions of `lang/`.

## The adapter protocol

The runner calls `ADAPTER OP FILE [FLAG...]` with the working directory
at the root of this repository, and with `NIX_PATH=lang/dir3:lang/dir4`,
`NIX_CONFIG="experimental-features = nix-command flakes"`,
`HOME=/fake-home` and `TEST_VAR=foo` in the environment.

| Op | Prints | Exit |
|:---|:---|:---|
| `parse FILE` | one line: `ok TREE`, or `ok` without a tree, or `error LINE:COL` (SPEC.md) | 0 |
| `check FILE` | anything | 0 if FILE parses and all its variables are bound, else non-zero |
| `nar FILE` | one line: `ok CONSUMED SHA256` or `error` | 0 |
| `eval FILE FLAG...` | the value, as `nix-instantiate --eval --strict FLAG... FILE` prints it | 0, or non-zero on an evaluation error |
| `eval-xml FILE FLAG...` | the value as `--eval --strict --xml --no-location` prints it | 0, or non-zero |

The `FLAG`s are `nix-instantiate` flags from a case's `.flags` file. An
adapter translates them, or exits 3. Exit 3 means "this implementation
does not do that", for any op: the case is skipped, not failed. In the
output, the runner replaces the repository's absolute path with `/pwd`,
as the `.exp` files expect.

`adapters/nix` is the reference adapter, and a short example of one.

## Run it

```sh
nix run github:numtide/nix-conformance -- ./my-adapter            # lang, parse, nar
nix run github:numtide/nix-conformance -- --tree ./my-adapter parse
nix run github:numtide/nix-conformance -- \
  --against "$(nix build github:numtide/nix-conformance#adapter --print-out-paths)/bin/nix-conformance-adapter" \
  ./my-adapter corpus/parse
```

`./run` in a checkout does the same with bash and coreutils.

| Flag | Effect |
|:---|:---|
| `--tree` | compare parse trees, not only accept, refuse and the position |
| `--known FILE` | the cases an implementation fails on purpose, one path a line: their failure counts as known, and their passing as a failure, so the list stays true |
| `--against REFERENCE` | compare with another adapter instead of `.exp` files, for `corpus/` |
| `--json` | one JSON object per failure or skip, then `{"summary": {...}}` |

The exit code is 0 when no case failed, 1 when one did, and 2 on bad
usage.

## Use it from a flake

```nix
inputs.nix-conformance.url = "github:numtide/nix-conformance";
# ...
checks.conformance = nix-conformance.lib.${system}.check {
  name = "my-implementation";
  adapter = "${my-adapter}/bin/my-adapter";
  flags = [ "--known" "${./known-failures}" ];
};
```

`packages.oracles` gives the reference as servers for a fuzzer: each
`*-oracle`, run without arguments, reads and writes the frames its
header describes.

## Add cases

- `lang/`: a `.nix` file and, for `eval-okay-*`, its `.exp` from Nix
  2.34.8.
- `parse/`, `nar/`: the input as `NAME.nix` or `NAME.nar`, then
  `./expect "$(nix build .#adapter --print-out-paths)/bin/nix-conformance-adapter"`
  writes `NAME.nix.exp`. An input on which the reference fails is no
  case: put it in `nix-bugs/` with a note.

`nix flake check` runs every case through the reference. A case whose
answer no longer holds for Nix 2.34.8 fails the check.

Not here yet: cases that need a writable store (`builtins.getFlake`,
`builtins.storePath`, `builtins.toFile` read back), and derivations.

## Licence

LGPL-2.1-or-later, as Nix: `lang/` comes from the Nix source tree.
