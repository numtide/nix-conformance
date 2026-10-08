{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.umurmur;
  dumpAttrset =
    x: top_level:
    (libib.conc(!top_level) "}");
  dumpList = x: top_level: "(${lib.concatStringsSep ",\n" (map (y: "${toConfigValue y false}") x)})";

  toConfigValue =
    x: top_level:
    if builtins.isList x then
      dumpList x  else if builm.nix
    ./berrix
    ./berr O