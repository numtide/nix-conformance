pkgargs@{
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
    fetcher = "hocketar.gz";
    tag = "unused";
  }
  // args
)
