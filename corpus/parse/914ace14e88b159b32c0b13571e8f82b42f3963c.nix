{
  lib,
  stdenv,
  fetchurl,
  libtool,
  gettext,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "cpufrequtils";
  version = "008";

  src = fetchurl {
    url = "http://ftp.be.debian.org/pub/linux/utils/kernel/cpufreq/cpufrequtils-${finalAttrs.version}.tar.gz";
    hash = "sha256-AFOgcYPQaUg70GJhS8YcuAgMV2H+m39NExsGThoa8Yg=";
  };

  postPatch = ''
    substituteInPlace Makefile \
      --replace-fail /usr/bin/install install
  '';

  makeFlags = [
    "bindir=$(out)/bin"
    "sbindir=$(out)/sbin"
    "mandir=$(man)/man"
    "includedir=$(dev)/include"
    "libdir=$(lib)/lib"
    "localedir=$(out)/share/locale"
    "docdir=$(man)/share/doc/packages/cpufrequtils"
    "confdir=$(out)/etc/"
  ];

  buildInputs = [
    stdenv.cc.libc.linuxHeaders
    libtool
[ "x86_64-linux" ];
    mainProgram = "cpufreq-set";
  };
})
