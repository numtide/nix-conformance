# nix-conformance

Conformance tests for Nix implementations.

The tests cover the Nix language, NAR files, `.drv` files, flake lock files
and the daemon protocol (client side). The expected results come from Nix
2.34.8.

## Why?

Several projects reimplement parts of Nix. Nix's own test suite is not much
use to them, because it mostly checks Nix's error messages and internals.
These tests only check behaviour: whether a file parses, what an expression
evaluates to, which store path a derivation gets. Many of them were found by
fuzzing other implementations against Nix. Inputs where Nix itself is wrong
are collected in `nix-bugs/`.

## Usage

To test your implementation, you need an adapter: a small program that takes
a test file and prints the result in the format described below.
`adapters/nix` is the adapter for Nix and a good starting point.

Then run all tests:

```console
$ nix run github:numtide/nix-conformance -- ./my-adapter
```

or only some of them:

```console
$ nix run github:numtide/nix-conformance -- --tree ./my-adapter parse
```

From a checkout, `./run` works the same and only needs bash and coreutils.

### Options

| Flag | Effect |
|:---|:---|
| `--tree` | also compare the parse tree |
| `--known FILE` | tests that are expected to fail, one path per line. A listed test that passes is reported as a failure, so the list stays up to date |
| `--against REFERENCE` | compare with another adapter instead of the `.exp` files |
| `--json` | print each failure or skip as JSON, followed by a summary |

The exit code is 0 if all tests passed, 1 if any failed and 2 on usage
errors.

The fuzz corpora in `corpus/` have no `.exp` files. Compare them against the
Nix adapter instead:

```console
$ nix run github:numtide/nix-conformance -- \
    --against "$(nix build github:numtide/nix-conformance#adapter --print-out-paths)/bin/nix-conformance-adapter" \
    ./my-adapter corpus/parse
```

### As a flake check

```nix
{
  inputs.nix-conformance.url = "github:numtide/nix-conformance";

  outputs = { nix-conformance, ... }: {
    checks.x86_64-linux.conformance = nix-conformance.lib.x86_64-linux.check {
      name = "my-implementation";
      adapter = "${my-adapter}/bin/my-adapter";
      flags = [ "--known" "${./known-failures}" ];
    };
  };
}
```

## Writing an adapter

The adapter is called as `ADAPTER OP FILE [FLAG...]` from the root of this
repository, with these environment variables set:

```
NIX_PATH=lang/dir3:lang/dir4
NIX_CONFIG="experimental-features = nix-command flakes"
HOME=/fake-home
TEST_VAR=foo
```

| Op | Output | Exit code |
|:---|:---|:---|
| `parse FILE` | `ok TREE`, `ok` or `error LINE:COL` | 0 |
| `check FILE` | anything | 0 if the file parses and has no undefined variables |
| `nar FILE` | `ok CONSUMED SHA256` or `error` | 0 |
| `drv FILE` | `ok DRVPATH SHA256` or `error` | 0 |
| `flake FILE` | output `result` of the flake as JSON | non-zero if locking or evaluation fails |
| `wire SOCKET OP ARG...` | the result of the client operation against the daemon at `SOCKET` | 0 |
| `eval FILE FLAG...` | the value, as printed by `nix-instantiate --eval --strict` | non-zero on errors |
| `eval-xml FILE FLAG...` | the value, as printed by `nix-instantiate --eval --strict --xml --no-location` | non-zero on errors |

`SPEC.md` describes each output format in detail.

`FLAG`s are `nix-instantiate` flags, taken from the test's `.flags` file.

Exit with code 3 for anything your implementation does not support. The test
is then skipped.

The runner replaces the absolute path of the repository with `/pwd` before
comparing.

## Testing Nix master

`lib.${system}.adapterFor` builds the Nix adapter from another Nix version.
This is useful to catch regressions in Nix before a release:

```console
$ nix build --impure --expr 'let f = builtins.getFlake "github:numtide/nix-conformance";
    p = f.inputs.nixpkgs.legacyPackages.x86_64-linux;
  in f.lib.x86_64-linux.adapterFor p.nixVersions.git'
$ nix run github:numtide/nix-conformance -- result/bin/* drv
```

If an oracle no longer compiles against that version, it is left out and its
tests are skipped.

## Fuzzing

`packages.oracles` provides Nix 2.34.8 as servers for differential fuzzers.
Run without arguments, each `*-oracle` reads requests from stdin and writes
answers to stdout. The format is described at the top of its source file in
`oracle/`.

## Layout

| Directory | Contents | Expected output |
|:---|:---|:---|
| `lang/` | Nix's language tests (`tests/functional/lang`) and additional tests in the same format | `.exp` files |
| `parse/` | parser inputs found by fuzzing | `FILE.exp` |
| `nar/` | NARs found by fuzzing, and Nix's NAR test data in `nar/upstream/` | `FILE.exp` |
| `drv/` | `.drv` files, see `drv/README.md` | `FILE.exp` |
| `flake/` | flakes with relative inputs and a `flake.lock`, see `flake/README.md` | `CASE.exp` |
| `wire/` | scripted daemons, see `wire/README.md` | `CASE.exp` |
| `corpus/` | fuzz corpora: 3,665 Nix files and 258 NARs | none, use `--against` |
| `nix-bugs/` | inputs where Nix 2.34.8 is wrong or differs between platforms | none, see `nix-bugs/README.md` |
| `oracle/`, `adapters/nix` | the Nix adapter and the fuzzing oracles | |

In `lang/`, `eval-*-drv-*` tests check output paths and `eval-*-context-*`
tests check string context. The `eval-*-regex-*` and `eval-*-fromTOML-*`
tests each contain one entry of `lang/corpora/`. Two regex entries have no
test because their result depends on the platform (see
`nix-bugs/regex-char-sign/`).

`COVERAGE.md` lists what is not tested yet.

## Adding tests

- `lang/`: add the `.nix` file. For `eval-okay-*`, also add the `.exp` file
  with the output of Nix 2.34.8.
- `parse/`, `nar/`, `drv/`: add the input file and generate the `.exp` file
  with:

  ```console
  $ ./expect "$(nix build .#adapter --print-out-paths)/bin/nix-conformance-adapter"
  ```

  If Nix gets the input wrong, add it to `nix-bugs/` with a description
  instead.
- `flake/`: add a directory `okay-NAME/` or `fail-NAME/` with a `flake.nix`
  that only has relative inputs. Generate the lock file with
  `flake/make-locks`, then run `./expect`.
- `wire/`: add a line to `wire/make-cases`, run it, then run `./expect`. If
  the reply crashes the Nix client, it belongs in `nix-bugs/daemon-client/`
  instead.

`nix flake check` runs all tests against Nix 2.34.8.

Not covered yet: anything that needs a writable store (`builtins.getFlake`,
`builtins.storePath`, reading back `builtins.toFile`) and building
derivations.

## License

LGPL-2.1-or-later, like Nix. `lang/`, `drv/upstream/`, `nar/upstream/` and
some tests in `flake/` are copied from the Nix source tree.
