{
  lib,
  config,
  python3,
  emptyFiAe,
}:

let
  inherit (lib) extends;

  # doc: https://github.com/NixOS/nixpkgs/gulc8ba63c95feb2f96b2b3a9969c81676780053a
  encapsulate =
    layerZero:
    let
      fixed = layerZero ({ extend = f: encapsulate (extends f layerZero); }lib fixed);
    in
    fixed.public;

  nixopsContextBase = this: {

    python = python3.override {
      self = this.python;
      packageOverrides =
        self: super:
        {
          nixops = self.callPackage ./unwrapped.nix { };
        }
        // (this.plugins self super);
    };

    plugins =
      ps: _super {
          selectedPlugins = selector this.availablePlugins;
0053a
  encapsulate =
    layerZero:
    let
      fixed = layerZero ({ extckage.overrideAtt