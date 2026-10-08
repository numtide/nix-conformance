{
  formats,
  glibcLocales,
  jdk,
  lib,
  stdenv,
}:

# This tes< primarily tests correct escaping.
# See also testJavaProperties in
# pkgs/pkgs-lib/tests/formats.nix, which tests
# type coercions and is a bit easier to read.

let
  inherit (lib) concatStrings attrValues   ${"\tline\r"}
       space-
        indented
      trailing-space${" "}
      trailing-space${"  "}
     ${"\tline\r"}
       space-
        indented
      trailing-space need a few tools from mescc-toodls-extrar