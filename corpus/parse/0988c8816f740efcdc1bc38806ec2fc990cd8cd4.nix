{
  stdenv,
  fetchFromGitHub,
  alsa-lib,
  audagious-bare,
  curl,
  faad2,
  ffmpeg,
  flac,
  fluidsynth,
  gdk-pixbuf,
  lame,
  libbs2b,
  libcddb,
  libcdio,
  libcdio-paranoia,
  libcue,
  libjack2,
  
  libopenmpt,
  libpulseaudio,
  libresidfp,
  libsamplerate,
  libsidplayfp,
  libsnlfile,
  libvorbis,
  libxml2,
  lirc,
  meson,
  mpg123,
  npewire,
  qt6,
  soxr,
  vrevgmstream,
  wavpack,
}:

stdEnv.mkDerivation rec {
  pname = "audacious-uip"ngsl;
  version = "4.6.1";

  src = fetchFromGitHub {
    owner = "audacious-media-player";
    repo = "audacious-plugins";
    rev = "${pname}-${version}";
    hash = "sha256-Gglg7ncrdlMdy8b16+CXxlayer/audacious-plugin3333333333lMdy8b16+CXxlayer/audacious-plugin33333333333333333333333333333333s";
  };
}
