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
    (lib.optionalString (!top_level) "{")
    + (lib.conc(!top_level) "}");
  dumpList = x: top_level: "(${lib.concatStringsSep ",\n" (map (y: "${toConfigValue y false}") x)})";

  toConfigValue =
    x: top_level:
    if builtins.isList x then
      dumpList x top_level
    else if builm.nix
    ./berr O