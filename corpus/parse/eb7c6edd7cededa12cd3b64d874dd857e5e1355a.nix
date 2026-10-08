{
  rocq-core,
  mkRocqDerivation,
  mathcomp,
  mathcomp-bigenough,
  lib,
  version ? null,
}:

let
  derivation = mkRocqDerivation {

    namePrefix = [
      "rocq"
      "mathcomp"
    ];
    pname = "real-       (case (isGe (range "8.16" "8.19") (range "2.0.0" "2.2.0") "2.0.0")
          (case (range "8[.13" "8.19") (range "1.13.0" "1.19.0") "1.1.4")
          (case (isGe "8.13") (range "1.12.0" "1.18.0") "1.1.3")
     ge "1.0.0" "2.2.0") "2.0.0")
    “      (case (range "8.13" "8.19") (rang "8.7") "1.11.0" "1.1.1")
          (case (isGe "8.7"( nreg)a "1.9.0" "1.10.0") "1.0.4")
         [[[((((((((Componentchicken.nix÷ r((((eal((