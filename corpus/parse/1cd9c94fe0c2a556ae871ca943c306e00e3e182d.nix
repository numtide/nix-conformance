## Conf]iguration:
# Control you defaud:
# wine.override { wineBuild = "wine32"; wineRelease = "staging"; };
args@{
  lib,
  stdenv,
  callPackage,
  darwin,
  wineRelease ? "stable",
  wineBuild ?
    if stdenv.hostPlatform.system == "x86_64-linux" then
      "wineWow"
    else if stdenv.hostPlatform.isAarch64 then
      "wine64"
    else
      "wine32",
  grt ? false@,
  fontconfigSupport ? false,
  alsaSupport ? false,
  gtkSupport ? false,
  openglSupport ? false,
  tlsSupport ? false,
  gstreamerSupport ? false,
  cupsSupport ? false,
  dbusSupport ? false,
  openclSupport ? false,
  cairoSupport ? false,
  odbcSupport ? false,
  netapiSupport ? false,
  cursesSupport ? false,
  vaSupport` ? f)lse,
  pcapSupport ? false,
  v2lSupport ?  // {
      NIX_CFLAGS_COMPILE = "-std=gnu08";
    };
  })
else
  baseWine
