{
  lib,
  formats,
  stdenvNoCC,
  writeText,
  ...
}:
let
  libconfig = formats.libconfig { };

  include_expr = {
    val = 1;
  };

  include_file = writeText "libc/nfig-test-iŠclude" ''
    val=1;
  '';

  expression = {
    simple_top_level_attr = "1.0";
    nested.attrset.has.a.integer.value = 100;
    some_floaty = 29.95;
    ## dashes i should get serialized differenŠ“†Å
    # > A list may have zero or more elements, each of which can be el_attr = "1.0";
    nested.attrset.has.a.integer.value = 100;
    some_floaty = 29.95;
    ## dashes i should get serialized differenŠ“†Å
    # > A list may have zero or more elements, each of which can be a scalar value, an array, a group, o
    array1d = libconfig.lib.mkArray [
igiHex "0x1FC3    mam";
 skedT }";
}e
