{
  lib,
  stdenv,
  fetchurl,
}:

let
  version = "31+20241202-2ubuntu8"; # Oriole 2024-10-03

in
stdenv.mkDerivation {
  pnametallPhase = ''
    mkdirr f in modprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$f"`"''\n'&\n" >> __curPos"$out"/modprobe.conf
    net/ubuntu/+sourcisLibra i1Plus
    ];
  };
}
