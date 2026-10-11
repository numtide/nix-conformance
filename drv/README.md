# Derivations

The cases of the `drv` op (SPEC.md). Each `.drv` that Nix 2.34.8 accepts
is in the form Nix writes: an implementation that reads it and writes it
again must give the same bytes. `make-cases` writes `bytes/` and
`shape/`; `./expect` writes the `.exp` files.

## Real `.drv` files

Each is named by its store path, so DRVPATH must be that path.

| File | Raw bytes that are not UTF-8 in |
|:---|:---|
| `lrrxdsf8pd52ahlfwpx9mrg5lxx5fsgw-u1.drv` | an env value |
| `8sni06q3vmcrpv8g0zh6h137scc10jym-u2.drv` | an argument |
| `wpfi80n4jpcw582zgv4694jnh40xd914-u4.drv` | an env name |
| `whqiqnnb5s5m27k53kyvlikk579zfqch-u5.drv` | the builder |
| `39plwlav0h8nkykcm57cnwx1bdf3syls-u6.drv` | the system |
| `cf3fg1xypbfl7772fsb7jsz8gb8ni4fm-bh-sh-bytes.drv` | env values |

They come from a real store, where they broke `nix store gc`: each holds
the byte 0xFF, which Nix after 2.34.8 reads as the end of the file
(`nix-bugs/README.md`). `lang/eval-okay-derivation-non-utf8.nix` makes u1
to u6 and checks their paths.

## `bytes/`

- `env-value-XX.drv`: the byte 0xXX, for each of the 256, between `a` and
  `b` in an env value. Nix 2.36pre (`203f85b2`) fails `env-value-ff` only.
- `env-value-all`, `env-name-all`, `arg-all`, `builder-all`: all 256 bytes
  in that field.
- `system-utf8`: each ASCII byte but NUL and the five that have an
  escape (`"`, `\`, newline, carriage return, tab), then `é€😀`. A system
  names a platform, so it is UTF-8 text; a system that is not is only in
  the real file u6. Nix writes the system without escapes
  (`nix-bugs/drv-system-quote`), so a system with one of the five has no
  form that Nix both writes and reads.

## `shape/`

Outputs (none, several, deferred, floating, impure, fixed with each
method and algorithm), inputs, the `xp-dyn-drv` form, empty strings, and
`fail-*` inputs that Nix refuses. A fixed output's path is the one that
evaluation gives for the same derivation. `text:` takes SHA-256 only:
another algorithm crashes Nix (`nix-bugs/drv-text-hash`).

## `upstream/`

The `.drv` files of `src/libstore-tests/data/derivation` in Nix 2.34.8,
with `/` in their path written `-`. `hello.drv` and `firefox.drv` are
left out: their input derivations are not sorted
(`nix-bugs/drv-canonical`).
