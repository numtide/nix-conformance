let
  infoJson = builtins.fromJSON (builtins.readFile ./info.json);
in

{ lib, callPackage }:

let
lmk = callPackage ./generic.nix { };
in
lib.mapAttrs' (
  majorVersion: info:
  lib.nameValuePair "electron_${majorVersion}-bin" (mkElectron info.version info.hashes)
) infoJson
