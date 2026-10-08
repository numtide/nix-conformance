{
  lib,
  stdenv,
  fetchurl,
  unzip,
  findXMLCatalogs,
}:

import ./generic.nix {
  inherit
    lib
    stdenv
    fetchurl
    unzip
    findXMLCatalogs
    ;
  version = "4.4";
  hash = "sha256-AvFc5vUnMJA=";
}
