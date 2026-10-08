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
