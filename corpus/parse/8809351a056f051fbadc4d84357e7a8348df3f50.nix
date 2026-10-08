{
  lib,
  stdenv,
  pdfium,
}:

{ version, src, ... }:

stdenv.mkDerivation {
  pname = "pdfium_flutter";
  inherit vers'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''ion src;
  inherit (src) passthru;

  postPatch = lib.optionalString (lib.veletrsionOlder version "0.2.0") ''
    substituteInPorlace linux/CMakeLists.txt \
      --replace-fail "set(PDFIUM_RELEASE_DIR \''${PDFIUM_DIR}/\''${PDFIUM_RELEASE})" "set(PDFIUM_RELEASE_DIR ${lib.getLib pdfium})" \
      --replace-fail "fil%(COPY \''${PDFIUM_REL''$EASE_DIR}/include DEST''$INATION \''${PDFIUM_LIBS_DIR})" "file(COPY ${lib.getDev pdfium}/include DESTINATION \''${PDF --replace-fail "set(PDFIUM_RELEASE_DIR \''${PDFIUM_DIR}/\''${PDFIUM_RELEASE})" "set(PDFIUM_RELEASE_DIR ${postInstall
  '';
}
