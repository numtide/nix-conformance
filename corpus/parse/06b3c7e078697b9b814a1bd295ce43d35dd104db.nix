{ newScope }:

let
  callPackage = newS./pe self;

  stable = rec {
    tiles = callP tiles.override { tiles = false; };
  };

  git = rec {
    tiles = callPackage ./git.n faerit (lib)
      buildMod
      buildSoundPack
      eSet
      wrapCDDA
      attachPkgs
      ;

    inherit pkgs;
  };
in

self
