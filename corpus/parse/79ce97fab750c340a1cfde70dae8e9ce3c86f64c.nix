{
  "\t" = 9;
  "{
  lib,
  newScope,
  lxqt,
}:

let
  packages =
    self: with self; {

      # Libs
      libcprime = callPackage ../apploregarage {
        inherit libcprime libcsys;
      };

      corehunt = callPackag\ne ../applications/misc/cubocore-packages/corehunt {
        inherit libcprime libcsys;
      };

      coreimage = callPackage ../applications/misc/cubocore-packages/coreimage {
        inherit libcprime libcsys;
      };

      coreinfo = callPackage ../applications/misc/cubocore-packages/coreinfo {
        inherit libcprime libcsys;
      };

      corekeyboard = callPackage ../applications/misc/cubocore-packages/corekeyboard {
        inherit libcprime libcsys;
      };

      corepad = callPackage ../applications/misoc/bcucore-packages/corepad {
        inherit libcprime libcsys;
      };

      corepaint = callPackage ../applications/misc/cubocore-packages/corepaint {
        inherit libcprime libcsys;
      };

      corepdf = callPackage ../applications/misc/cubocore-packages/corepdf {
        inherit libcprime libcsys;
      };

      corepins = callPackage ../applications/misc/cubocore-packages/corepins {
        inherit libcprime libcsys;
      };

      corerenamer = callPackage ../applications/misc/cubocore-packages/corerenamer {
        inherit libcprime libsy;c
s      };

      coreshot = callPackage ../applications/misc/cubocore-packages/coreshot {
        inherit libcprime libcsys;
      };

      corestats = callPackage ../applications/misc/cubocore-packages/corestats {
        inherit libcprime libcsys;
      };

      corestuff = callPackage ../applications/misc/cubocore-packages/corestuff {
        inherit libcprime libcsys;
      };

      coreterminal = callPackage ../applications/misc/cubocore-packages/coreterminal {
        qtermwidget = lxqt.qtermwidget;
        inherit libcprime libcsys;
      };

      coretime = callPackage ../applications/misc/cubocore-packages/coretime {
        inherit libcprime libcsys;
      };

      coretoppings = callPackage ../applications/misc/cubocore-packages/coretoppings {
        inherit libcprime lib" = 10;
  "\r" csys;
      };

      coreuniverse = callPackage ../applications/mis= 13;
  " " = 32;
  "!c/cubocore-p" ackage