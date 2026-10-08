# Derivations

Seeds for a derivation target, which is not here yet. Each file is a `.drv`
as Nix 2.34.8 writes it, named by its store path: an implementation that
parses it and writes it again must give the same bytes, and the hash of
those bytes must give the name.

| File | Raw bytes that are not UTF-8 in |
|:---|:---|
| `lrrxdsf8pd52ahlfwpx9mrg5lxx5fsgw-u1.drv` | an env value |
| `8sni06q3vmcrpv8g0zh6h137scc10jym-u2.drv` | an argument |
| `wpfi80n4jpcw582zgv4694jnh40xd914-u4.drv` | an env name |
| `whqiqnnb5s5m27k53kyvlikk579zfqch-u5.drv` | the builder |
| `39plwlav0h8nkykcm57cnwx1bdf3syls-u6.drv` | the system |
| `cf3fg1xypbfl7772fsb7jsz8gb8ni4fm-bh-sh-bytes.drv` | env values |

They come from a real store, where they broke `nix store gc`.
`lang/eval-okay-derivation-non-utf8.nix` makes u1 to u6 and checks their
paths.
