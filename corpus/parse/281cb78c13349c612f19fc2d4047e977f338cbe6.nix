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

mkDeri  buildInputs = compatIfNeeded ++ [
    libnv
    libsbuf
  ];
atforms = lib.platelses.unix;
}
