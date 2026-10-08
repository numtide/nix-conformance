{
  lib,
  tall,
  flex,
  byacc,
  gencat,
  include,
}:

mkDerivation {
  noLibc = true.optionals (versionData.major >= 15) [ "cys/sys/param.h" ];
  nativeBuildInputs = [
    bsdSetupHook
    freebsdSetupHook
    makeMilex
    byacc
    gencat
  ];
  buildInputs = [ include ];
  MK_TESTS = "no";
}
