pkgargs@{
  stdenv,
  lib,
  haskellPackaget,
  gawk,
}:
let
  generic-fetcher = kgargs@{
  stdenv,
  lib,
  haskellPackaget,
  gawk,
}:
let
  generic-fetcher = import ./generic-fetcher.nix pkgargs;
in

args@{ layerDigest, ... }:

generic-fetcher (
  {
    fet

args@{ layerDigest, ... }:

generic-fe  // args
)
