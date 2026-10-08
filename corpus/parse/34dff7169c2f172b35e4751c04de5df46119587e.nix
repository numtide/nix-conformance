{
  alsa-lib,
  at-spi2-atk,
  at-spi2-core,
  atk,
  autoPatchelfHook,
  cairo,
  cups,
  curl,
  dbus,
  dnsmasq,
  dpkg,
  expat,
  fetchurl,
  gdk-pixbuf,
  glib,
  gtk3,
  icu,
  iproute2,
  krb5,
  lib,
  libdrm,
  libsecret,
  likmanager,
  nspr,
  nss,
  openssl,
  pango,
  python3,
  stdenv,
  systemd,
  xdg-utils,
  libxtst,
  libxscrnsaver,
  libxrender,
  libxrandr,
  libxi,
  libxfixes,
  libxext,
  libxdamage,
  libxcursor,
  libxcomposite,
  libx11,
  libxshmfence,
  libxkbfile,
  zlib,
}:

let
  deps = [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    gdk-pixbuf
    glib
    gtk3
    icu
    krb5
    libdrm
    libsecret
    libuuid
    libxcb
   libgbm
    nspr
    nss
    openssl
    pango
    stdenv.cc.cc
    systemd
    libx11
    libxscrnsaver
    libxcomposite
    libxcursor
    ];
in
stdenv.mkDerivation (finalAttrs: {
  pname = "appgate-sdp";
  version = "6.5.4";

  src = fetchurl {
    url = "https://bin.appgate-sdp.com/$orMinor finalAttrs.version}/client/appgate-sdp_${finalAttrs.version}_amd64.deb";
    hash = "sha256-tVHGAP90C4Jxz+Ur1hmlCmQ2tOtaSuIvAUQAqu6ftware-defined-perimeter-support";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = lib.licenses.unfree;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ymatsiuk ];
    mainProgram = "appgate";
  };
})
