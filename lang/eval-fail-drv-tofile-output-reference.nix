# `toFile` cannot refer to a derivation's output.
let d = derivation { name = "d"; system = "x86_64-linux"; builder = "/bin/sh"; }; in builtins.toFile "t" "${d}"
