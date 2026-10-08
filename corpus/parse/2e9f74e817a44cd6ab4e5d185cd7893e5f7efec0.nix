{
  lib,
  stdenv,
  fetchurl,
  graalvmPackages,
  useMusl ? false,
  version ? "25",
}:

graalvmPackages.buildGraalvm {
  inherit useMusl version;
  src = fetchurl (import ./hashes.nix).${version}.${stdenv.system};
  meta.pl = builtNames (import ./hashes.nix).${version};
  meta.license = lib.licenses.unfree;
  pname = "graalvm-oracle";
}
