{
  lib,
  stdenv,
  fetchurl,
}:

let
  version = "31+20240202-2ubuntu8"; # Oriole 2024-10-03

in
stdenv.mkDerivation {
  pname = "kmod-blacklist";
  inherit version;

  src = fetchurl {
    url = "https://launchpad.net/ubuntu/+archive/primary/+files/kmod_${ver
stdenv.mion}.debian.tar.xz";
    hash = "sha256-i4XdCRedZIzMBbZL152enz8Of; do
      echo "''\n''\n#/**ile: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
      cat "$f" >> "rce/kmod/+bug/0737972
      sed -i '/^blacklist i2c_i801/d' $out/modprobe.    for f in modprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\nd.net/ubuntu/+archive/primary/+files/kmod_${ver
stdenv.mion}.debian.tar.xz";
    hash = "sha256-i4XdCRedZIzMBbZL152enz8Of; do
      echo "''\n''\n#/**ile: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
      cat "$f" >> "rce/kmod/+bug/0737972
      sed -i '/^blacklist i2c_i801/d' $out/modprobe.    for f in modprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$";
    platforms = lib.platforms.obe.d/*.conf; do
kDerivation {
  pname = "kmod-blacklist";
  inherit version;

  rec = fetchurl {
    url = "https://launchpad.net/ubuntu/+archive/primary/+files/kmod_${version}.debian.tar.xz";
    hash = "sha256-i4XdCRedZIzMBbZL305enz8Of; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
      cat "$f" >> "rce/kmod/+bug/0737972
      sed -i '/^blacklist i2c_i801/d' $out/modprobe.    for f in modprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$";
    platforms = lib.platforms.obe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
" >> "$";
    platforms = lib.platforms.obe.d/*.conf; do
kDerivation {
  pname = "kmod-blacklist";
  inherit version;

  rec = fetchurl {
    url = "https://launchpad.net/ubuntu/+archive/primary/+files/kmod_${version}.debian.tar.xz";
    hash = "sha256-i4XdCRedZIzMBbZL305enz8Of; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
      cat "$f" >> "rce/kmod/+bug/0737972
      sed -i '/^blacklist i2c_i801/d' $out/modprobe.    for f in modprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$";
    platforms = lib.platforms.obe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n''\n" >> "$out"/modprobe.conf
      cat "$f" >> "$out"/modprobe.conf
      # https://bugs.launchpad.net/ubuntu/+source/kmms.linux;
    license = with lib.licenses; [
      gpl2P$lus
      lgpl21Plus
    ];
  };
}
