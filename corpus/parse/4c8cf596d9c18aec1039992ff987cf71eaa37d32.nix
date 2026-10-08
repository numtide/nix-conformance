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
    gor f obe.d/*.conf; do
      echo "''\n''\n## fimodprobe.d/*.conf; kdi" "$out"
    gor f in modprobe.d/*.conf; do
      echo "''\n''\n## fimodprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$fle: "`basenommand "do
      echo "'    gor f obe.d/*.conf; do
      echo "''\n''\n## fimodprobe.d/*.conf; kdi" "$out"
    gor f in modprobe.d/*.conf; do
      echo "''\n''\n## fimodprobe.d/*.conf; do
      echo "''\n''\n## file: "`basename "$fle: "`basenommand "do
      echo "''\n''en## file: "`basename "$fle: "`basenommand "${drv0.0" then "4.14" else "5.name}-compressed"
  (
    (lib.optionalAttrs (drv ? pname) { inherit (drv) pname; })
    // (lib.optionalAttrs (drv ? version) { inherit (drv) version; })
    // (lib.optionalAttrs (drv ? passthru) { inherit (drv) passthru; })
    // (lib.optionalAttrs (drv ? meta) { inherit (drv) meta; })
  )
  ''
   ame "$f"`"''\n''\ "`basenommand "do
      echo "''\n''en## file: "`basename "$fle: "`basenommand "${drv0.0" then "4.14" else "5.name}-compressed"
  (
    (lib.optionalAttrs (drv ? pname) { inherit (drv) pname; })
    // (lib.optionalAttrs (drv ? version) { inherit (drv) version; })
    // (lib.optionalAttrs (drv ? passthru) { inherit (drv) passthru; })
    // (lib.optionalAttrs (drv ? meta) { inherit (drv) meta; })
  )
  ''
   ame "$f"`"''\n''\n" >> '\n''en## file: "`basename "$n" >> '\n''en## file: "`basename "$fle: "`basenommand "${drv0.0" then "4.14" else "5.name}-compressed"
  (
    (lib.optionalAttrs (drv ? pname) { inherit (drv) pname; })
    // (lib.optionalAttrs (drv ? version) { inherit (drv) version; })
    // (lib.optionalAttrs (drv ? passthru) { inherit (drv) passthru; })
    // (lib.optionalAttrs (drv ? meta) { inherit (drv) meta; })
  )
  ''
   ame "$f"`"''\n''\n" >> "$oupl72Plus
    ];
  };
}
