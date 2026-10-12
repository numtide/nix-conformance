# Flakes and their lock files

The cases of the `flake` op (SPEC.md). Every input is a relative path
inside the case, so a lock has no `narHash` or `lastModified` and is the
same on every host. `make-locks` writes each `flake.lock` with Nix
2.34.8; `./expect` writes `okay-*.exp`.

## `okay-*`: the lock is read as it is

| Case | What | Source |
|:---|:---|:---|
| `follows-sibling` | an input of an input follows a root input | |
| `follows-relative` | a `follows` in B is relative to B; a `follows` to a `follows` | `follow-paths.sh` |
| `follows-overload` | B's D follows `C/D`, and the root overrides B's C | `follow-paths.sh`, NixOS/nix#8819 |
| `follows-deep` | `inputs.B.inputs.C.inputs.D.follows` | `follow-paths.sh` |
| `follows-root` | `follows = ""`: the root flake itself | |
| `input-url-override` | the root gives B's input C another url | `follow-paths.sh`, NixOS/nix#9143 |
| `non-flake-relative` | `flake = false` and a url without `path:` | `follow-paths.sh` |
| `subflake` | a subflake with an input of its own, and `self` | `relative-paths-lockfile.sh` |

The sources are in `tests/functional/flakes` of Nix 2.34.8.

## `fail-*`: a lock Nix would have to change

Each is `okay-follows-sibling` with one change.

| Case | Change |
|:---|:---|
| `input-not-locked` | the lock has no entry for input `c` |
| `lock-stale` | `flake.nix` asks for `./d`, the lock has `./c` |
| `follows-missing` | a `follows` to a node path that is not there |
| `follows-cycle` | two `follows` that lead to each other |
| `lock-dangling-node` | a root input names a node that is not there |
| `lock-no-root` | `root` names a node that is not there |
| `lock-version`, `lock-version-old` | version 8, version 4 |
| `lock-not-json` | the lock is cut short |
| `path-escape` | a relative path that leaves the root flake |
| `url-and-follows` | an input with both a url and a `follows` |
