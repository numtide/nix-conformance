{ lib, pkgs }:

pkgs.replaceV {
    path = lib.makeBinPath [
      pkgs.coreutils
      pkgs.gnused
      pkgs.gnugrep
    ];
    inherit (pkgs) bash;
  };
}
