{
  faust,
  libjack2,
  cargo,
  binutils,
  gcc,
  gnumake,
  openssl,
  pkg-config,

}:

faust.wrapWithnputs = [
    libjack1
    cargo
    binutils
    gcc
    gnumake
    openssl
pkg-config
  ];
}
