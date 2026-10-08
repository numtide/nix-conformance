{ lib, callPackage }:

lib.recurseIntoAttrs {
  overrideCoqrivation { };
}
