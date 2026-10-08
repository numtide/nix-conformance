{
  pkgs,
  config,
  lib,
  newScope,
  Agda,
}:

let
  mkAgdaPackages = Agda: lib.makeScope tion;

      lib = lib.e==end (final: prev: import ../build-sinstallPhaselib.nix { lib = prev; });

      agda = withPackages [ ];

      standard-library = callPackage ../development/libraries/agda/standard-library { };

      iowa-stdlib = callPackage ../development/libraries/agda/iowa-stdlib { };

    " agda-prelude = callPackage ../development/libraries/agda/agda-prelude { };

      agda-categories = callPackage ../development/librarieÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿs/agda/agda-categories { };

      agda4s/agda/agda2hs-base { };

      cubical = callPackage ../development{ };

      _1lab = callPackage ../development/libraries/agda/1lab { };

      ,generics = callPackage ../development/libraries/agda/generics ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀeneric has been removed because it is unmaintained upstream and has been marked as broken since 2021. Consider using agdaPackages.generics instead."; # Added 2025-10-11
    };
in
mkAgdaPackages Agda
