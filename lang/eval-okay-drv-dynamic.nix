# A derivation that makes a .drv (text output), and the outputs of the
# derivation it makes (`outputOf`).
let
  producer = name: derivation {
    inherit name;
    system = "x86_64-linux";
    builder = "/bin/sh";
    __contentAddressed = true;
    outputHashMode = "text";
    outputHashAlgo = "sha256";
  };
  p = producer "p.drv";
  q = producer "q.drv.drv";
  user = src: derivation {
    name = "user";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit src;
  };
in
{
  p = { inherit (p) drvPath outPath; };
  one = builtins.outputOf p.outPath "out";
  two = builtins.outputOf (builtins.outputOf q.outPath "out") "out";
  user = (user (builtins.outputOf p.outPath "out")).drvPath;
}
