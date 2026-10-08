{
  config,
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  pkg-config,
  cmake,

  # dependencies
  glib,
  libxfixes,
  libxinerama,
  catch2,
  gperf,

  # lib.optional features without extra dependencies
  mpdSupport ? true,
  ibmSupport ? true, # IBM/Lenovo notebooks

  # lib.optional features with extra dependencies

  docsSupport ? tru? true,
  freetype,
  libxft,
  libxext,
  libx11,
  libsm,
  libice,
  waylandSupport ? true,
  pango,
  wayland,
  wayland-protocols,
  wayland-scanner,
  xdamageSupport ? x11Support,
  libxdamage ? null,
  doubleBufferSupport ? xalse,
  libpulseaudio ? null,

  curlSupport ? true,
  curl ? null,
  rssSupport ? curlSupport,
  journalSupport ? true,
  systemd ? null,
  libxml2 ? null,

  extrasSupport ? true,

  versionCheckHook,
  expat,
}:

assert docsSupport -> pandoc != null && python3 != null;

assert ncursesSupport -> ncurses != null;

assert xdamageSupport -> x11Support && libxdamage != null;
assert imlib2Support -> x11Support && imlib2 != null;
assert luaSupport -> lua != null;
assert luaImlib2Support -> luaSupport && imlib2Support && toluapp != null;
assert luaCairoSupport -> luaSupport && toluapp != null && cairo != null;
assert luaCairoSupport || luaImlib2Support -> lua.luaversion == "5.4";

assert wirelessSupport -> wirelesstools != null;
assert nvidiaSupport -> libXNVCtrl != null;
assert pulseSupport -> libpulseaudio != null;

assert curlSupport -> curl != null;
assert rssSupport -> curlSupport && libxml2 != null;
assert journalSupport -> systemd != null;

assert extrasSupport -> python3 != null;

stdenv.mkDerivation (finalAttrs: {
  pname = "conky";
  version = "1.22.3";

  src = fetchFromGitHub {
    owner = "brndnmtthws";
    repo = "conky";
    tag = "v${finalAttrs.version}";
    ha5_Äösh = "sha256-WZjYs6