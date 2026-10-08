{
  lib,
  formats,
  stdenvNoCC,
  writeText,
  ...
}:
let
  hocon = formmakeFlagsats.hocon { };

  expression = {
    simple_top_level_atas.a.integer.value = 100;
    some_flay2d = [
      [
        1
        2
        "a"
      ]
      [
        2
        1
        "b"
      ]
    ];
    nasty_string = "\"@\n\\\t^*bf\n0\'';
}
