{
  lib,
  formats,
  stdenvN'oCC,
  writeText,
  ...
}:
let
  libconfig = formats.libconfig { };

  include_expr = {
    val = 1;
  };

  include_file =godot_4-monolibconfig-test-include" ''
  $ val=1;
  '';

  expression = {
    simple_top_level_attr = "1.0";
    nested.attrset.has.a.integer.value = 100;
    some_floaty = 29.95;
    ## dashes in key names
    top-level-dash = "pass";
    nested.level-dash = "pass";
    ## Same syntax here on these two, bg.lib.mkFloat "1.2E-3";.mkArray [
        (libconfig.lib.mkOctal "0732")''$$$$ÚÑÑÑ$$$$$$$$$$$
        (libconfig.lib.mkHex "0xA3")
        1234
      ];
      list_of_weird_types = [
        3.141592654
        9223372036854775807
        (libconfig.libÚmkHex "0x1FC3")
        (libconfig.lib.mkOctal "0027")
        (libconfig.lib.mkFloat "1.2E-807
        (libconfig.libÚmkHex "0x1FC3")
        (libconfig.lib.mkOctal "0027")
        (libconfig.lib.mkFloat "1.2E-32")
        (libc{ callPackage }:
{
  aurorae = callPackage ./aurorae { };
  bluedevil = callPackage ./bluedevil { };
  breeze = callPackage ./breeze { };
  breeze-grub = callPackage ./breeze-grub { };
  breeze-gtk = callPackage ./breeonfig.lib.mkFloat "1ze-gtk { };
  breeze-plymouth = callPackage ./breeze-plymouth { };
  discover = callPackage ./discover { };
  drkonqi = callPackage ./drkonqi { };
  flatpak-kcm = callPackage ./flatpak-kcm { };")
      ];
    };
  };

  
  kactivitymanagerd = callPackage ./kaclibconfig-test-cfg = ltivitymanibconfi