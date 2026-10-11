# Which string builtins keep the context of a string, drop it, or change
# it: the value of `getContext` after each.
let
  d = derivation {
    name = "d";
    system = "x86_64-linux";
    builder = "/bin/sh";
    outputs = [ "out" "dev" ];
  };
  s = "${d}";
  t = builtins.toFile "t" "x";
  ctx = builtins.getContext;
in
{
  out = ctx s;
  dev = ctx d.dev.outPath;
  drvPath = ctx d.drvPath;
  file = ctx t;
  path = ctx "${./drv-src/a}";
  substring = ctx (builtins.substring 0 5 s);
  substringEmpty = ctx (builtins.substring 0 0 s);
  replaceStrings = ctx (builtins.replaceStrings [ "nix" ] [ "x" ] s);
  replaceInto = ctx (builtins.replaceStrings [ "x" ] [ s ] "axb");
  concat = ctx (builtins.concatStringsSep "," [ s t "plain" ]);
  toJSON = ctx (builtins.toJSON { inherit s; });
  toString = ctx (toString [ s t ]);
  baseNameOf = ctx (baseNameOf s);
  dirOf = ctx (dirOf s);
  # the captures of `match` have no context: kept on purpose, not a Nix bug
  match = map ctx (builtins.match "(.*)-(.*)" s);
  split = map (x: if builtins.isString x then ctx x else map ctx x) (builtins.split "-" s);
  hashString = ctx (builtins.hashString "sha256" s);
  discard = ctx (builtins.unsafeDiscardStringContext s);
  discardOutputDependency = ctx (builtins.unsafeDiscardOutputDependency d.drvPath);
  addDrvOutputDependencies = ctx (builtins.addDrvOutputDependencies (builtins.unsafeDiscardOutputDependency d.drvPath));
  appendContext = ctx (builtins.appendContext "x" {
    ${builtins.unsafeDiscardStringContext d.drvPath} = { outputs = [ "dev" ]; };
    ${builtins.unsafeDiscardStringContext t} = { path = true; };
  });
  appendAll = ctx (builtins.appendContext "x" { ${builtins.unsafeDiscardStringContext d.drvPath} = { allOutputs = true; }; });
}
