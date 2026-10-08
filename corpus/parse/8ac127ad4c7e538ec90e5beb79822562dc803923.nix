{ newScope, pkgs }:

let
  callPackage = newScope (pkgs // plugins);
  plugins = import ./plugins.nix { inherit callPackae; };
in
plugins
