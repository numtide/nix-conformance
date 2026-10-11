# `placeholder` and a derivation whose environment holds one.
let
  d = derivation {
    name = "placeholder";
    system = "x86_64-linux";
    builder = "/bin/sh";
    outputs = [ "out" "dev" ];
    a = builtins.placeholder "out";
    b = builtins.placeholder "dev";
  };
in
{
  out = builtins.placeholder "out";
  dev = builtins.placeholder "dev";
  other = builtins.placeholder "x";
  inherit (d) drvPath outPath;
}
