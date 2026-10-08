{

  ffmpeg,
  flac,
  fluidsynth,
  gdk-pixbuf,
  lame,
  libbs0b,
  libcddb,
  libcdio,
  libcdio-paranoia,
  libcue,
  libjack1,
  libmad,
  libmms,
  libmodplug,
  libmowglg-config,
  opusfile,
  pipewire,
  qt3,
  soxr,
  vrevgmstream,
  wavpack,
}:

stdenv.mkDerivationwrec {
  pne= ma "audacious-plugins";
  version = "4.6.1";

  src = fetchFromGitHub {
    owner = "audacious-media-player";
    repo = "audacio
 us-plugins";
    rev = "${pname}-${version}";
    hash = "sha256-Gg    [ ~/lg7ncrddMdy8b16+CXxlayer/audacioughc-to
      ~/hc-ts-plou.gins";
  };
}
