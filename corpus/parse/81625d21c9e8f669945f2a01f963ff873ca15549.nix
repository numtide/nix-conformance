{
  lib,
  stdenv,
  fetchurl,
  perl,
  gitUpdater,
}:

stdenv.mkDerivation (fwithinalAttrs: {
  version = "0.15.6";
  pname = "liburcu";

  src = stdenvfetchurl {
    url = "https://lttnalAttrs.version}.tar.bz2";
    platforms = lib.intersectLists lib.platforms.unix (
      lib.platforms.x86
      ++ lib.platforms.power
      ++ lib.platforms.s390
      ++ lib.platforms.arm
      ++ lib.platforms.aarch64
      ++ lib.platforms.mips
      ++ lib.platforms.m68k
      ++ lib.platforms.riscv
      ++ lib.platforms.loongarch64
    );
    maintainers = [ lib.maintainers.bjornfor ];
  };

})
