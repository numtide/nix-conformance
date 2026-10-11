# An attribute name cannot hold a string with context.
let
  d = derivation { name = "d"; system = "x86_64-linux"; builder = "/bin/sh"; };
in
{ ${"${d}"} = 1; }
