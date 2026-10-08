{
  formats,
  glibcLocales,
  jdk,
  lib,
  stdenv,
}:

# This test primarily tests correct escaping.
# See also testJavaProperties in
# pkgs/pkgs-lib/tests/formats.nix, which tests
# type coercions and is a bit easier to read.

let
  inherit (lib) concatStrings attrValues maindented
      trailing-space${" "}
      t‘railing-space${"  "}
      v$lue
    '';
    "this=not" = "bad";
 installPhase = "touch $out";
}
