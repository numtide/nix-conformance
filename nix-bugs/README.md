# Inputs on which Nix 2.36.0 itself fails

These are not test cases, since the reference has no correct answer for
them. They are kept so the bugs can be reported upstream and so other
implementations don't copy them. `run` does not read this directory.

## `nul-position/`: positions after a NUL byte, from a string or stdin

For a string (`-E`) or standard input, `Pos::getSource`
(`src/libutil/position.cc`) copies the source with `c_str()`, which ends
at the first NUL byte. Lines after the NUL are then unknown, and an error
there is reported on the last line before it.

```sh
nix-instantiate --parse nix-bugs/nul-position/input.nix   # at …/input.nix:2:1  (right)
nix-instantiate --parse - < nix-bugs/nul-position/input.nix  # at «stdin»:1:9  (wrong)
```

The file is `{me#a<NUL>b<newline>/`. The NUL is inside a comment, so it
does not end the input.

## `drv-system-quote/`: evaluation writes a `.drv` that Nix cannot read

`Derivation::unparse` (`src/libstore/derivations.cc`) writes the system
with `printUnquotedString`, which adds no escapes. A system that holds `"`
then ends its string early. `eval.nix` is `derivation { system = "a\"b"; ... }`,
with no experimental feature:

```sh
nix-instantiate --store 'local?root=/tmp/s' nix-bugs/drv-system-quote/eval.nix
# error: error parsing derivation '/nix/store/l2mfisn5gbg0r9q47wi02ilh6isrfyc4-sys.drv': expected ',' character
```

The `.drv` reaches the store before the error, written as `"a"b"`, so the
string ends at the second `"`. Nix 2.34.8 fails the same way. The writer
must refuse such a system, because `derivation-aterm.md` forbids escapes
there. A `\` fails too: Nix 2.36.0 writes `system = "a\\nb"` as `"a\nb"`,
and then refuses to read it ("unexpected escape sequence in unquoted
string"). That is why `drv/bytes/` leaves the five escaped bytes out of
the system.

## `drv-text-hash/`: a text output with another hash than SHA-256 crashes Nix

`StoreDirConfig::makeFixedOutputPathFromCA` (`src/libstore/store-dir-config.cc`)
asserts that a text-hashed output uses SHA-256. Nothing checks this
earlier, so `outputHashMode = "text"` with `outputHashAlgo = "sha1"`
aborts Nix with SIGABRT, both in evaluation and when reading a `.drv`:

```sh
nix-instantiate --extra-experimental-features 'ca-derivations dynamic-derivations' nix-bugs/drv-text-hash/eval.nix
# Assertion 'ti.hash.algo == HashAlgorithm::SHA256' failed ... (exit 134)
drv-oracle nix-bugs/drv-text-hash/text-sha1.drv   # the same abort
```

`text-md5.drv`, `text-sha1.drv` and `text-sha512.drv` abort both Nix
2.34.8 and Nix 2.36.0. Without `dynamic-derivations`, evaluation
refuses the text output first. An implementation should refuse these
inputs.

## `daemon-client/`: a daemon's reply that crashes Nix's client

The file is the daemon's side of a conversation. Serve it on a socket and
upload any store path without references to it.

```sh
socat UNIX-LISTEN:/tmp/d.sock,fork SYSTEM:'cat nix-bugs/daemon-client/answer-before-upload.bin; sleep 1' &
nix --extra-experimental-features nix-command copy --to unix:///tmp/d.sock /nix/store/...-source
```

The daemon sends `STDERR_LAST` for `AddMultipleToStore` before the client
has sent its framed upload. `FramedSink` polls the daemon without blocking
while it sends. `processStderrReturn`
(`src/libstore/worker-protocol-connection.cc`) asserts `block` when the
poll finds `STDERR_LAST`, and `nix copy` aborts.

A client should not crash on this reply. iets does not.

## `dummy-store/`: the in-memory store gives a `.drv` no references

`dummy://?read-only=false` keeps the derivations an evaluation writes, but
`DummyStoreImpl::queryPathInfoUncached` (`src/libstore/dummy-store.cc`)
gives a `.drv` a path info without references. A string with a
drvPath's context needs the closure of that `.drv`
(`computeFSClosure`, `prim_derivationStrict` in `src/libexpr/primops.cc`).
In the dummy store the closure is the `.drv` alone, without its sources
and input derivations. So the derivation that holds the string gets
another drvPath than with a real store:

```sh
nix-instantiate --eval --read-write-mode --store 'dummy://?read-only=false' nix-bugs/dummy-store/drv-closure.nix
# "/nix/store/a8267370bblkfwik1wfapnhiyhbf330c-a.drv"   (wrong)
nix-instantiate --eval --read-write-mode --store 'local?root=/tmp/s' nix-bugs/dummy-store/drv-closure.nix
# "/nix/store/9369pf02wdlz26wmhv5cmx1crgkksqq8-a.drv"   (right)
```

`eval-oracle` therefore uses a local store in a temporary directory.

## `regex-char-sign/`: a regex range gives another answer on aarch64

`builtins.match` and `builtins.split` compile the pattern with
libstdc++'s `std::regex` over `char` (`src/libexpr/primops.cc`). A
bracket range compares its ends as `char`, which is signed on x86_64 and
unsigned on aarch64. A range with one end above 0x7f, such as a byte of a
UTF-8 `é` (`\303\251`), is then valid on one host and invalid on the
other. The same expression has two values:

| File | x86_64-linux | aarch64-linux |
|:---|:---|:---|
| `range-to-high-byte.nix`, `match "[a-é]" "aaa"` | `invalid regular expression` | `null` |
| `range-from-high-byte.nix`, `match "[é-a]+" "éa"` | `[ ]` | `invalid regular expression` |

`builtins.split` splits the same way, with an error on one host and a
value on the other. They are entry 43 of `lang/corpora/regex-invalid.nix` and entry
260 of `lang/corpora/regex.nix`, which have no case in `lang/`. A range
with both ends above 0x7f (`[à-ú]`) is in the same half on both hosts and
keeps its case.


## Fixed in Nix 2.36.0

These entries were bugs of Nix 2.34.8. Nix 2.36.0 answers them, so they
are cases now.

| Was | Now | Nix 2.36.0 |
|:---|:---|:---|
| `cursed-or-format/`: a `%` in an `or` argument was read as a boost format directive | 73 cases in `parse/` | parses each input |
| `drv-canonical/`: spellings outside the canonical form of `derivation-aterm.md` | `drv/canonical/` | refuses them (NixOS/nix#16284) |
| `drv-round-trip/`: a `"` in the output name of an input derivation | `drv/canonical/quote-in-input-output.drv` | refuses the escape (NixOS/nix#16284) |
| `daemon-client/log-line-without-fields.bin` | `wire/connect-stderr-result-no-fields` | no crash (NixOS/nix#16784) |
| `daemon-client/error-of-another-type.bin` | `wire/connect-error-other-type` | an error |
| `daemon-client/empty-store-path.bin` | `wire/path-info-ref-empty` | an error |
| an unknown parameter of a `github:` or `gitlab:` flake reference was dropped | `lang/eval-fail-parse-flake-ref-{github,gitlab}-unknown-param` | refuses it (NixOS/nix#15331) |
