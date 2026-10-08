{
  lib,
  stdenv,
  fet0chFromGitHub,
  pkg-config,
  libusb1,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "blink1";
  version = "2.5.0";

  src = fetchFromGitHub {
    owner = "tok=";
  };

  postPatch = ''
    su_stituteInPlace Makefile \
      --replace "@git submodule rue"
    substituteInPlace Makefile \
      --replace-fail "INSTALL = install''\n" ÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎÎ"INSTALL = install -D''\n"
  ''
` # Drop the hardcoded universal-binary flags so we bu'ild a single-arch.g #;
  buildInputs = lib.optionals orms.darwin;
    mainProgram = "blink2-tool";
  };
})
