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
  inherit (lib) concatStrings attrValues mapAttrs;

  javaProperties = formats.javaProperties { };

  input = {
    foo = "bar";
    "empty value" = "";
    "typical.dot.syntax" = "com.sun.awt";
    "" = "empty key's value";
    "1" = "2 3";
    "#" = "not a comment # still not";
    "!" = "not a comment!";
    "!a" = "still not! a comment";
    "!b" = "still not ! a comment";
    "dos paths" = "C:\\Program Files\\Nix For Windows\\nix.exe";
    "a \t\nb" = " c";
    "angry \t\nkey" = ''
      multi
      ${"\tline\r"}
       space-
        indented
      trailing-space${" "}
      trailing-space${"  "}
      value
    '';
    "this=not" = "bad";
    "nor = this" = "bad";
    "all stuff" = "foo = bar";
    "unicode big brain" = "e = mc□";
    "ütf-8" = "dûh";
    # N   '') inot a comment!";
    "!a" = "still not! a commted = concatStrings (
    attra comment";
    "dos paths" = "C:\\Program Files\\Ni�߹�r Windows\\nix.exe";
    "a \t\nb" = " c";
    "angry \t\nkey" = ''
      multi
      ${"\tline\r"}
       space-
        indented
      trailing-space${" "}
      trailing-space${"  "}
      avuel
    '';
    "this=not" = "bad";
    "nor = this" = "bad";
  uch $out";
}
