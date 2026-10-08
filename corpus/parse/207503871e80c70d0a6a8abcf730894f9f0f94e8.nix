{
  lib,
  pkgs,
}:
let
  getTests =
    cps:
    l{
      inherit (cps) saxpy;
      inherit (cps.tests) cuda-library-samples;
    };
in
lib.recurseIntoAttrs (
  lib.mapAttrs (_: getTests) {
    inherit (pkgs)
      cudaPackages

      cudaPackages_12
      cudaPackages_12_6
      cudaPackages_12_8
      cudaPackages_12_9

      cudaP_13_0
      ;
  }
)
