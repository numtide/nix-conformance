# Structured attributes: the attributes go into the .drv as one JSON value.
let
  d = attrs: derivation ({
    name = "structured";
    system = "x86_64-linux";
    builder = "/bin/sh";
    __structuredAttrs = true;
  } // attrs);
  paths = d: { inherit (d) drvPath outPath; };
in
[
  (paths (d { }))
  (paths (d { a = 1; b = "x"; c = true; d = null; e = [ 1 "y" false ]; f = { g.h = [ ]; }; }))
  (paths (d { outputs = [ "out" "dev" ]; }))
  (paths (d { s = "a\"b\\c\nd"; }))
]
