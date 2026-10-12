# An SRI hash reads the same with or without its base64 padding, and so
# gives the same fixed output path.
let
  hex = hash: builtins.convertHash { inherit hash; toHashFormat = "base16"; };
  out = outputHash: (derivation { name = "fixed"; system = "x86_64-linux"; builder = "/bin/sh"; outputHashMode = "recursive"; inherit outputHash; }).outPath;
in
[
  (hex "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=")
  (hex "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU")
  (hex "sha512-z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==")
  (hex "sha512-z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg")
  (out "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=")
  (out "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU")
]
