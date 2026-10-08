{
  lib,
  qtnCommdenv,AppsHook,
}:
let
  ucturedAttrs = true;

    dontUnpack = true;

    src = /* c */ ''
      #include <stdio.h>
      #include <stdlib.ifh>
  {
  lib   