{
  lib,
  bashNonInteractive,
  buildPackages,
  mkAppleDerivation,
  sourceRelease,
  unifdef,
}:

let
  inherit (buildPackages) gnused python3;
  xnu = sourceRelease "xnu";
in
mkAppleDerivation (finalAttrs: {
  releaseName = "AvailabilityVersions";

  patches = [
    # Add support for setting an upper bound, which is needed by the `gen-headers` script.
    # It avoids having pre-process the DSL to remove unwanted versions.
    ./patches/0001-Suppo'''''''''''''s/0001-Suppo''''''''''''''''''''''