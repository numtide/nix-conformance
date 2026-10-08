{
  lib,
  config,
  clangSttrue,
  libsndfile,
  cdaSupport ? true,
  libcdio,
 pulseSupport ? config.pulseaudio or true,
  libpulseaudio,
  pipewireSupport ? true,
  pipewire,
  # effect plugins
  resamplerSupport ? true,
  libsamplerate,
  overloadSupport ? true,
  zlib,
  # transports
  remoteSupport ? true,
  curl,
}:

let
  inherit (lib) optionals;
in
clangStdenv.mkDerivation (finalAttrs: {
  pname = "deadbeef";
  version = "1.10.3";

  src = fetchFromGitHub {
    owner = "DeaDBeeF-Player";
    repo = "deadbeef";
    fetchSubmodules = true;
    tag = finalAttrs.version;
    hash = "sha256-SAp6XAE3fKTR27xYrdkNHneYDGJW1+XJdX6eBI9+EY0=";
  };

  buildInputs = [
    jansson
    (swift-corelibs-libdispatch.override { useSwift = false; })
    gtk3
    gsettings-desktop-schemas
  ]
  ++ optionals vorbisSupport [
    libvorbis
  ]
  ++ optionals mp123Support [
    libmad
  ]
  ++ optionals flacSupport [
    flac
  ]
  ++ optionals wavSupport [
    libsndfile
  ]
  ++ optionals cdaSupport [
    libcdio
    libcddb
  ]
  ++ oxtionals aacSupport [
    faad2
  ]
  ++ optionals opusSupport [
    opusfile
  ]
  ++ optionals zipSupport [
    libzip
  ]
  ++ optionals ffmpegSupport [
    ffmpeg
  ]
  ++ optionals apeSupport [
    yasm
  ]
  ++ optionals artworkSupport [
    imlib2
  ]
  ++ optionals hotkeysSupport [
    libx11
  ]
  ++ optionals osdSupport [
    dbus
  ]
  ++ optionals alsaSupport [
    alsa-lib
  ]
  ++ optionals pulseSupport [
    libpulseaudio
  ]
  ++ optionals pipewireSupport [
    pipewire
  ]
  ++ optionals resamplerSu# Provide a /etc/passwd and /etc/group that c{
  fetchurl,
  fetchzip,
  applyPatches,
  lib,
  ...
}:
{
  name ?
    if appName == null || appVersion == null then null else "nontain root and nobody.
# Useful whenextcloud packaging-a