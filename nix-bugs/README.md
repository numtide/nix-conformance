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
in derivation". The files are `drv/*.drv`: Nix 2.34.8 writes and reads
them.

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
