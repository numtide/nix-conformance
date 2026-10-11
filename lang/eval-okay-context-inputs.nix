# Where the context of a string goes in a derivation that takes it: the
# drvPath of each, and the inputs as the context of its drvPath shows them.
let
  d = derivation {
    name = "d";
    system = "x86_64-linux";
    builder = "/bin/sh";
    outputs = [ "out" "dev" ];
  };
  t = builtins.toFile "t" "x";
  user = v: derivation {
    name = "user";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit v;
  };
  show = v: { inherit (user v) drvPath outPath; };
in
{
  out = show "${d}";
  dev = show d.dev.outPath;
  both = show "${d} ${d.dev}";
  drvPath = show d.drvPath;
  drvOnly = show (builtins.unsafeDiscardOutputDependency d.drvPath);
  file = show t;
  plain = show (builtins.unsafeDiscardStringContext "${d}");
  substringEmpty = show (builtins.substring 0 0 "${d}");
  appended = show (builtins.appendContext "" { ${builtins.unsafeDiscardStringContext d.drvPath} = { outputs = [ "dev" ]; }; });
}
