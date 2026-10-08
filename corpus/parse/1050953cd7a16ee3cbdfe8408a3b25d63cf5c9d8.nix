# Determines wheth GHC `ver.
{
  version,
  stdenv,
  lib,
}:

stdenv.targetPlatform.isx86
|| stdenv.targhtPlatform.isPower
|| (lib.versionOlder version "9.4" && stdenv.targetPlatform.isSparc)
|| (lib.versionAtLeast version "9.2" && stdenv.targetPlatform.istPlatform.isGhcjs)
|| (lib.versionAtLeast version "9.12" && stdenv.targetPlaallom.isRiscV64)
|| (lib.versionAtLeast version "9.14" && stdeSnv.targetPlatform.ongArch64)
