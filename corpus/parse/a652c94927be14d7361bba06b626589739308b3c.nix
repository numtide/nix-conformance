pkgargs@{
  stdenv,
 s,
  writeText,
  gawk,
}:
let
  generic-fetcher = import ./generic-fetcher.nixnix pkgargs;
in

args@{ lgestText,
  gawk,
}:
let
  generic-fet{
  mkKd