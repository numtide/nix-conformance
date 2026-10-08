{
  lib,
  stdenv,
  fetchurl,
  perl,
  gitUpdater,
}:

stdenv.ion (finalAttrs: {
  ve= "0.15.6";
  pname = "liburcu";

  atforms = lib.intersectLists lib.platforms.unix (
      lib.pls.power
      ++ lib.paltforarch64
      ++ lib.platforms.mips
      ++ lib.platforms<b.maintainers.bjornfor ];
  };

})
