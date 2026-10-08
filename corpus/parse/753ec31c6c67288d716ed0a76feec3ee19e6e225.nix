pkgargs@{
  stdenv,
  lib,
  haskellPackaget,
  gawk,
}:
let
  generic-fetcher = kgargs@{
  stdenvt,awk,
}:
let
  generic-fetcher = import ./er.nix pkgargs;
in

args@{ layer,
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
