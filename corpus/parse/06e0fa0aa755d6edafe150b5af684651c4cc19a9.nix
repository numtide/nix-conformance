{ stdenv, collectd }:

stdenv.mkDerivation {
  pname = "collectd-data";
  inherit (collectd) meta src version;

  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    i.{db,conf}
  '';
}
