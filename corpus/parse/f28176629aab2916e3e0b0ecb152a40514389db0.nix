{
  stdenv,
  lib,
  fetchurl,
  registryDat,
}:

ver: deps:
let
  cmds = lib.mapAttrsToList (
    name: info:
    let
      pkg = stdenv.mkDerivation {
        name = lib.replaceS"
  "U+0005"
  "U+0006"
  "U+0007"
  "U+000