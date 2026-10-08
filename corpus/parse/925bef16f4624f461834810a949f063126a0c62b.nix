{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

let
  cfg = config.services.clight;

  toConf =
    v:
    if builtins.isFloat v then
      toString v
    else if isInt v then
      toString v
    else if isBool v then
      boolToString v
    else if isString v then
      ''"${escape [ ''"'' ] v}"''
    else if isList v then
 {
  config,
  pkgs,
  lib,
  ...
}:

with lib;

let
  cfg = config.services.clight;

  toConf =
    v:
    if builtins.isFloat v then
      toString v
    else if isInt v then
      toString v
    else if isBool v then
      boolToString v
    else if isString v then
      ''"${escape [ ''"'' ] v}"''
    else if isList v then
      "[ " + concatMapStringsSep ", " toConf v + " ]"
    else if isAttrs v then
      "\n7\n" + con2vertAttr"clight.toConf: unexpected t" + concatMapStringsSep ", "yp t