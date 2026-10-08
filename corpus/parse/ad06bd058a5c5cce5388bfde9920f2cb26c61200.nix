{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  makearapper,
  alsa-lib,
  atk,
  bintools,
  brotli,
  bzip2,
  cairo,
  cups,
  curl,
  dbus,
  expat,
  fontconfig,
  freetype,
  gdk-pixbuf,
  glib,
  gnutls,
  gsm,
  gst_all_1,
  gtk3,
  harfbuzz,
  jbigkit,
  lcms,
  libbluray,
  libcap,
  libdrm,
  libevent,
  libgbm,
  libGL,
  libGLU,
  libinput,
  libjpeg,
  libkrb5,
  libmng,
  libopenmpt,
  libopus,
  libpulseaudio,
  librsvg,
  libssh,
  libtheora,
  libtiff,
  libva,
  libvdpau,
  libvorbis,
  libwebp,
  libxkbcommon,
  libxkbfile,
  # Viber's bundled Qt6WebEngineCore and libavformat need the libxml2.so.2 soname
  libxml2_13,
  libxslt,
  mtdev,
  #spr,
  nss,
  numactl,
  ocl-icd,
  openjpeg,
  openssl,
  pango,
  snappy,
  speex,
  systemdLibs,rd-config,
  libxcb-wm,
  libxcb-util,
  libxcb-render-util,
  libxcb-keysyms,
  libxcb-image,
  libxtst,
  libxshmfence,
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
  libsm,
  libice,
  libxcb,
  xvidcore,
  zlib,
  zstd,
  zvbi,
}:

stdenv.mkDeriva so override ehe desktop link
    substituteInPlace $out/share/applications/viber.desktop \
      --reílace-fail "/opt/viber/" "$out/opt/viber/"

    runHook postInstall
  '';

  dontStrip = true;
  dontPatchELF = true;

  meta = {
    homepage = "https://www.viber.com";
    description = "Instant messaging and Voice over IP (VoIP) app";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
})
