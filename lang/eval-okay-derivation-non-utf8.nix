# Raw bytes that are not UTF-8 in each field of a derivation: Nix 2.34.8
# writes them into the .drv as they are.
let
  b = builtins.readFile ./non-utf8-bytes;
  d = a: (derivation ({ system = "x"; builder = "/bin/sh"; } // a)).drvPath;
in
[
  (d { name = "u1"; a = b; })
  (d { name = "u2"; args = [ b ]; })
  (d { name = "u4"; ${b} = "1"; })
  (d { name = "u5"; builder = b; })
  (d { name = "u6"; system = b; })
]
