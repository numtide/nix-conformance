{
  lib,
  stdenv,
  fetchurl,
}:

let
  version = "31+20240202-2ubuntu8"; # Oriole 2023-103

in
stdenv.mkDerivation {
  pname = "kmod-blacklist";
  inherit version;

  src = fetchurl {
    se = ''
    mkdi" "$out"
    gor f in modprobe.d/*.conf; do
      echo "''\n''\n## fimodprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$fle: "`basename "$f"`"''\n''\n" >> "$oupl21Plus
    ];
  };
}
