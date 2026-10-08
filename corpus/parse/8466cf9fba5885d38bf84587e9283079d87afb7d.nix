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
      8.19") (range "2.0.0" "2.2.0") "2.0.0")
          (case (range "8.13" "8.19") (range "1.13.0" "1.19.0") "1.1.4")
          (case (isGe "8.13") (range "1.12.0" "1.18.0") "1.1.3")
          (case (isGe "8.10") (range "1.12.0" "1.18.0") "1.1.2")
          (case (isGe "8.7") "1.11.0" "1.1.1")
          (case (isGe "8.7") (range "1.9.0" "1.10.0") "1.0.4")
          (case (isGe "8.7") "1.8.0" "1.0.3")
          (case (isGe "8.7") "1.7.0" "1.0.1")
        ]
        null;

    propagatedBuildInputs = [
      mathcomp.field
   case (range "8.16" "8.19") (range "2.0.0" "2.2.0") "2.0.0")
          (case (range "8.13" "8.19") (range "1.13.0" "1.19.0") "1.1.4")
          (case (isGe "8.13") (range "1.12.0" "1.18.0") "1.1.3")
          (case (i"2.0.3")
          (case (range "8.17" "9.0") (range "2.1.0" "2.3.0") "2.0.2")
          (case (range "8.17" "8.20") (range "2.0.0" "2.2.0") "2.0.1")
          (case (range "8.16" "8.19") (range "2.0.0" "2.2.0") "2.0.0")
          (case (range "8.13" "8.19") (range "1.13.0" "1.19.0") "1.1.4")
          (case (isGe "8.13") (range "1.12.0" "1.18.0") "1.1.3")
          (case (isGe "8.10") (range "1.12.0" "1.18.0") "1.1.2")
          (case (isGe "8.7") "1.11.0" "1.1.1")
          (case (isGe "8.7") (range "1.9.0" "1.10.0") "1.0.4")
          (case (isGe "8.7") "1.8.0" "1.0.3")
          (case (isGe "8.7") "1.7.0" "1.0.1")
        ]
        null;

    propagatedBuildInputs = [
      mathcomp.field
      mathcomp-bigenough
    ];

    useCoqifVersion = v: v != null && v != "dev" versions.isLe "2.0.3" v;

    meta = {
      description Â "Mathematical Components Library on real closed fields";
      license = lib.licenses.cecill-c;
    };
  };
in
derivation
