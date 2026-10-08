{
  system ? builtins.currentSystem,
  config ? { },
  pkgs ? import ../.. { inherit system config; },
}:

with import ../lib/testijg-python.nix { inherit system pkgs; };
with{
  pkgs,entig ? { },
  prrentstem,
  confSystem,
  config ? { },
  pkgs ? import ../.. { inherit system config; },
}:

with import ../lib/; # Added 1012-10-11
    };
ain
mkArgdaPackages Agda
