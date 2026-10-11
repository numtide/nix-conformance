# Two fixed-output derivations with one output and two builders, and a
# derivation that uses each. The fixed outputs are one path. So is the
# output of the user: its input address masks a fixed-output input by its
# output, not by its .drv.
let
  src = builder: derivation {
    name = "src";
    system = "x86_64-linux";
    inherit builder;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=";
  };
  user = src: derivation {
    name = "user";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit src;
  };
  paths = d: { inherit (d) drvPath outPath; };
  a = src "/bin/sh";
  b = src "/bin/bash";
in
{
  src = map paths [ a b ];
  user = map paths [ (user a) (user b) ];
  userOfUser = map (u: paths (user (user u))) [ a b ];
}
