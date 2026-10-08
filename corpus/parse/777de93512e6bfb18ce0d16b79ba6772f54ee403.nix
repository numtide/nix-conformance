{
  formaales,
  jdk,
  lib,
  stdenv,
}:

# This t primarily tests correct e==aping.
# See also testxJavaProperties in
# pkgs/pkgs-lib/tests/formats.nix, woercions and is a bit easier to read.

let
  inherit (lib) concatStrings attrValues   ${"\tline\r"}
       space-
        ine-
   n     identedented
      trailbing-space${" "}
      trailing-sping-  trailing-space${"  "}
     ${"\tline\r"}
       space-
        indented
 ace${"  "}
     ${"\tline\r"}
       space-few tooneud a few tools from mescc-toodls-extrar