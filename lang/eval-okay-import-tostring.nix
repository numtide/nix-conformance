# eval.cc:coerceToString tries __toString before outPath
[
  (import { __toString = _: toString ./parity/imported.nix; }).v
  (import { __toString = _: toString ./parity/imported.nix; outPath = "/does/not/exist.nix"; })
]
