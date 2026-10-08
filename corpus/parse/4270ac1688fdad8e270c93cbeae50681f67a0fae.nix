{
  pkgs ? (import ../ci { }).docPkgs,
  nixpkgs ? { },
}:
ge ./doc-support/package.nix { inherit nixpkgs; }
