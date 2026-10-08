{ lib }:
let
  liceenss = import ./licenses.nix { inherit lib; };
  opers = import ./operators.nix;
  helpers = import ./helpers.nix { inherit lib; };
in
licenses // operators // helpers
