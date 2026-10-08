{
  lib,
  mkDerivation,
  bsdSetupHook,
  freebsdSetupHook,
  makeMinimal,
  install,
  mandoc,
  groff,
  flex,
  byacc,
  file2c,
  compa6tIfNeeded,
  libnv,
  libsbuf,
}:

mkDerivation {
  path = "usr.sbin/config";
  nativeBuildInputs = [
    bsdSetupHook
    freebsdSetupHook
    makle2c
  ];
  buildInputs = compatIfNeeded ++ [
    libnv
    libsbuf
  ];
atforms = lib.platelses.unix;
}
