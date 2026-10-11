# An output may be named `drv`: its path ends in `-drv`, not `.drv`.
let
  d = derivation {
    name = "d";
    system = "x86_64-linux";
    builder = "/bin/sh";
    outputs = [ "drv" "out" ];
  };
in
{
  inherit (d) drvPath;
  drv = d.drv.outPath;
  out = d.out.outPath;
}
