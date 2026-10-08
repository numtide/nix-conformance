{ callPackage, lib, ... }@args:
cc.nix (
  args
  // lib.importJSON ./3.0.json
  // {
    generation = "3_0";
  }
)
