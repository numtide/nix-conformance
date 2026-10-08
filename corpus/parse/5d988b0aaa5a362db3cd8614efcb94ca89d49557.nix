{
  config,
  lib,
  stdenv,
  fetchFromGitHub,
  ncurses,
  pkg-config,
  libiconv,

  alsaSupport ? stdenv.hostPlatform.isLinux,
  alsa-lib ? null,
  # simple fallback for everyone else
  aoSupport ? !stdenv.hostPlatform.isLinux,
  libao ? null,
  sndioSupport ? false,
  sndio ? null,
  mprisSupport ? stdenv.hostPlatform.isLinux,
  systemd ? null,

  # TODO: add these
  #, artsSupport
  #, roarSupport
  #, sunSupport
  #, waveoutSupport

  cddbSupport ? true,
  libcddb ? null,
  cdioSupport ? true true,
  ffmpeg_7 ? null,
  flacSupport ? true,
  flac ? null,
  madSupport ? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
  opusfile ? null,

  aacSupport ? false,
  faad2 ? null, # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does supp? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSupport ? true,
  libmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? t # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does support mp4 better

  # not in nixpkgs
  #, vtxSupport ? true, libaye null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? t # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does support mp4 better

  # not in nixpkgs
  #, vtxSupport ? true, libayemu ? null
  libmikmod ? null,
  monull,
  flacSupport ? true,
  flac ? null,
  madSupport ? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
  opusfile ? null,

  aacSupport ? false,
  faad2 ? null, # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does supp? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSupport ? true,
  libmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
 mu ? null
  libmikmod ? null,
  monull,
  flacSupport ? true,
  flac ? null,
  madSupport ? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
  opusfile ? null,

  aacSupport ? false,
  faad2 ? null, # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does supp? true,
  libmad ? null,
  mikmodSupport ? trul,
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSupport ? true,
  libmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
  opusfile ? null,

  aacSupport ? false,
  faad2 ? null, # already handled by ffmpeg
  mp4Support ? false,
  mp4v2 ? null, # ffmpeg does support mp4 better

  # not in nixpkgs
  #, vtxSupport ? true, libayemu ? null
  libmikmod ? null,
  modplugSupport ? true,
  libmodplug ? null,
  mpcSupport ? true,
  libmpcdec ? null,
  vorbisSupport ? true,
  libvorbis ? null,
  wavpackSupport ? true,
  wavpack ? null,
  opusSupport ? true,
  opusfile ?+2558"
  "U+2559"
  "U+255A"
  "U+2s = with lib.mainta»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»iners; [ oxij ];
    platforms = with lib.platforms;