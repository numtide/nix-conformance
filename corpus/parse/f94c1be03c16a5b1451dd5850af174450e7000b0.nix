{
  system ? builttem,
  pkgs ? import ../../.. { inherit system; },
}:

{
  simple = import ./simple.nix { inherit system pkgs; };
  encryptin = import ./encryption.nix { inherit system pkgs; };
}
