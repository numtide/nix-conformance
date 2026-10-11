# A floating content-addressed derivation: its outPath is a placeholder,
# and a derivation that uses it is deferred.
let
  ca = outputs: derivation {
    name = "ca";
    system = "x86_64-linux";
    builder = "/bin/sh";
    __contentAddressed = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    inherit outputs;
  };
  user = src: derivation {
    name = "user";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit src;
  };
  a = ca [ "out" ];
  b = ca [ "out" "dev" ];
in
{
  a = { inherit (a) drvPath outPath; };
  b = { inherit (b) drvPath; out = b.out.outPath; dev = b.dev.outPath; };
  user = { inherit (user a) drvPath outPath; };
  userOfDev = { inherit (user b.dev) drvPath outPath; };
}
