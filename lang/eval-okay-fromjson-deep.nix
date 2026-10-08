# nlohmann has no nesting limit; iets's is far above what Nix programs use
let
  rep = c: n: builtins.concatStringsSep "" (builtins.genList (_: c) n);
  deep = n: builtins.length (builtins.fromJSON (rep "[" n + rep "]" n));
in [ (deep 20000) (deep 100000) ]
