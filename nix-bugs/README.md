# Inputs on which Nix 2.34.8 itself fails

These are not test cases: the reference has no correct answer for them.
They are here so that the bugs can be reported upstream and so that an
implementation does not copy them. `run` does not read this directory.

## `cursed-or-format/`: a `%` in an `or` argument

Nix warns when `or` is used as an argument (`f x or`): `or` will become an
identifier in a future release. `ExprCall::warnIfCursedOr`
(`src/libexpr/nixexpr.cc`) builds that warning from the source text and
passes it to `warn()` as a boost format string. A `%` in the quoted
source is then read as a format directive.

| File | `nix-instantiate --parse FILE` |
|:---|:---|
| `bad-format-string.nix`, `f "%" or` | `error: boost::bad_format_string: format-string is ill-formed` |
| `too-few-args.nix`, `f "%d" or` | `error: boost::too_few_args: format-string referred to more arguments than were passed` |
| `abort.nix`, `i"%T%%"or` | a boost assertion fails: `Nix crashed. This is a bug.` and SIGABRT |

Without the `%`, each input parses. `all/` holds the 71 inputs the fuzzers
found in this class: 2 abort Nix, the others end in one of the two errors.

## `nul-position/`: positions after a NUL byte, from a string or stdin

For a string (`-E`) or standard input, `Pos::getSource`
(`src/libutil/position.cc`) copies the source with `c_str()`, which ends
at the first NUL byte. Lines after the NUL are then unknown, and an error
there is reported on the last line before it.

```sh
nix-instantiate --parse nix-bugs/nul-position/input.nix   # at …/input.nix:2:1  (right)
nix-instantiate --parse - < nix-bugs/nul-position/input.nix  # at «stdin»:1:9  (wrong)
```

The file is `{me#a<NUL>b<newline>/`: the NUL is inside a comment, so it
does not end the input.

## Nix after 2.34.8 cannot read some of its own `.drv` files

Not a bug of 2.34.8, which is right here: a regression on Nix master
(2.36pre, 203f85b2). `StringViewStream::get()` (`src/libstore/aterm.cc`,
since 69b449fe5) returns a signed `char`, so the byte 0xFF compares equal
to EOF, and a `.drv` with that byte in a string is "unterminated string
in derivation". These are cases in `drv/`, because Nix 2.34.8 writes and
reads them: through `lib.adapterFor nixVersions.git`, Nix 2.36pre fails
the six real `.drv` files, the four `bytes/*-all.drv` that hold 0xFF, and
of the 256 `bytes/env-value-XX.drv` only `env-value-ff`. The fix is
NixOS/nix#16580.

## `drv-system-quote/`: evaluation writes a `.drv` that Nix cannot read

`Derivation::unparse` (`src/libstore/derivations.cc`) writes the system
with `printUnquotedString`: no escapes. A system that holds `"` then ends
its string early. `eval.nix` is `derivation { system = "a\"b"; ... }`,
with no experimental feature:

```sh
nix-instantiate --store 'local?root=/tmp/s' nix-bugs/drv-system-quote/eval.nix
# error: error parsing derivation '/nix/store/l2mfisn5gbg0r9q47wi02ilh6isrfyc4-sys.drv': expected string ','
```

The `.drv` is in the store before the error, written as `"a"b"`: the
string ends at the second `"`. Nix 2.34.8 and Nix 2.36pre (203f85b2) both
fail so. The writer must refuse such a system, or escape it, as
`derivation-aterm.md` now forbids escapes there. A `\` is worse: 2.34.8
writes `system = "a\\nb"` as `"a\nb"` and reads it back with a newline,
as another derivation. `nix-instantiate` stops on "derivation has
incorrect output", and the `.drv` in the store has a drvPath other than
its name. So `drv/bytes/` leaves the five bytes with an escape out of the
system.

## `drv-text-hash/`: a text output with another hash than SHA-256 crashes Nix

`StoreDirConfig::makeFixedOutputPathFromCA` (`src/libstore/store-dir-config.cc`)
asserts that a text-hashed output uses SHA-256. Nothing checks that
before, so `outputHashMode = "text"` with `outputHashAlgo = "sha1"`
aborts Nix with SIGABRT, in evaluation and in reading a `.drv`:

```sh
nix-instantiate --extra-experimental-features 'ca-derivations dynamic-derivations' nix-bugs/drv-text-hash/eval.nix
# Assertion 'ti.hash.algo == HashAlgorithm::SHA256' failed ... (exit 134)
drv-oracle nix-bugs/drv-text-hash/text-sha1.drv   # the same abort
```

`text-md5.drv`, `text-sha1.drv` and `text-sha512.drv` abort both Nix
2.34.8 and 2.36pre (203f85b2). Without `dynamic-derivations`, evaluation
refuses the text output first. An implementation should refuse these
inputs.

## `drv-canonical/`: spellings that Nix 2.34.8 accepts and later Nix refuses

The ATerm document of Nix after 2.34.8
(`doc/manual/source/protocols/derivation-aterm.md`, "Canonical form")
gives each derivation one spelling. Nix 2.34.8 accepts these others. It
writes the derivation in its own form, so the bytes, and for most of them
the drvPath, change:

| File | Not canonical |
|:---|:---|
| `newline-in-string.drv` | a raw newline byte in a string |
| `unknown-escape.drv` | `\q` |
| `unsorted-env.drv` | env entries out of order |
| `duplicate-env.drv` | the same env name twice |
| `trailing-bytes.drv` | bytes after the closing parenthesis |
| `escape-in-system.drv` | an escape in the system |
| `input-not-drv.drv` | an input derivation whose path does not end in `.drv` |
| `fixed-path-mismatch.drv` | a fixed output whose path is not that of its hash |
| `unsorted-inputs.drv` | input derivations out of order: `hello.drv` of Nix's own test data |

Nix 2.36pre (203f85b2) refuses them. No `.drv` that Nix 2.34.8 writes has
one of them, so a store does not hold them, and the suite has no answer
for them: an implementation may accept or refuse.

## `daemon-client/`: a daemon's reply that crashes Nix's client

Each file is the daemon's side of a conversation: serve it on a socket and
point a client at it.

```sh
socat UNIX-LISTEN:/tmp/d.sock,fork SYSTEM:'cat nix-bugs/daemon-client/FILE; sleep 1' &
# empty-store-path.bin needs an operation that reads a path info:
# nix path-info --store unix:///tmp/d.sock /nix/store/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb-x
# answer-before-upload.bin needs an upload, of any store path without references:
# nix copy --to unix:///tmp/d.sock /nix/store/...-source
nix --extra-experimental-features nix-command store info --store unix:///tmp/d.sock
```

| File | What the daemon sends | Nix 2.34.8 |
|:---|:---|:---|
| `log-line-without-fields.bin` | a `STDERR_RESULT` of type 101 (a build log line) with no fields | `nix` aborts on `assert(n < fields.size())`; a client with the plain logger (`SimpleLogger::result`, `src/libutil/logging.cc`) reads `fields[0]` and segfaults |
| `error-of-another-type.bin` | a `STDERR_ERROR` whose type string is not `Error` | `readError` (`src/libutil/serialise.cc`) asserts `type == "Error"`: Nix aborts |
| `answer-before-upload.bin` | `STDERR_LAST` for `AddMultipleToStore` before the client has sent its framed upload | `FramedSink` polls the daemon without blocking while it sends; `processStderrReturn` (`src/libstore/worker-protocol-connection.cc`) asserts `block` when the poll finds `STDERR_LAST`: `nix copy` aborts |
| `empty-store-path.bin` | a `QueryPathInfo` reply with the empty string as a reference | `canonPath` (`src/libutil/file-system.cc`) asserts `!path.empty()` while it parses the store path: `nix path-info` aborts. The fuzzer saw the same in the replies of `QueryValidPaths`, `QueryMissing`, `QuerySubstitutablePathInfos` and `BuildPathsWithResults` (a derived path that starts with `!`) |

A client should not crash on any of these replies. iets does not.

## `drv-round-trip/`: a `.drv` that Nix reads but writes in a form it cannot read

`Derivation::unparse` (`src/libstore/derivations.cc`) writes the output
names of an input derivation with `printUnquotedStrings`: no escapes. The
parser reads them with escapes. A name that holds `"` then comes back
broken. `quote-in-input-output.drv` uses the output `a"b` of its input,
written `["a\"b"]`. Nix 2.34.8 reads it and writes `["a"b"]`, which it
then refuses. Evaluation refuses such an output name, as its path would
hold `"` (`is not a valid store path`), so only a `.drv`
written by hand has one. `drv-oracle` shows both steps:

```sh
drv-oracle nix-bugs/drv-round-trip/quote-in-input-output.drv   # ok ...
```

## `dummy-store/`: the in-memory store gives a `.drv` no references

`dummy://?read-only=false` keeps the derivations an evaluation writes, but
`DummyStoreImpl::queryPathInfoUncached` (`src/libstore/dummy-store.cc`)
makes the path info of a `.drv` with no references. A string with a
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

`builtins.split` gives the same split: an error on one host, a value on
the other. They are entry 43 of `lang/corpora/regex-invalid.nix` and entry
260 of `lang/corpora/regex.nix`, which have no case in `lang/`. A range
with both ends above 0x7f (`[à-ú]`) is in the same half on both hosts and
keeps its case.

## An unknown parameter of a `github:` or `gitlab:` flake reference

Nix 2.34.8 drops it: `parseFlakeRef "github:a/b?ref=x&unknown=1"` is
`{ owner = "a"; ref = "x"; repo = "b"; type = "github"; }`, and
`lastModified` in a `gitlab:` reference goes the same way. Nix after
2.34.8 (`203f85b2`) refuses both, which is safer: a misspelled `rev` or
`narHash` no longer goes unseen. No case has one, so an implementation
may accept or refuse it.
