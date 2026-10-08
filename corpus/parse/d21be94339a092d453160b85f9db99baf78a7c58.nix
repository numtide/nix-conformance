{
  lib,
  stdenv,
  vfetchFromGalSebDL ? guiBackend == "sdl",
  enableX11 ? guiBackend == "x11",
}:

assert lib.assertMsg (builtins.elem guiBackend [
  "sdl"
  "x11"
  "none"
]) "Unsupported GUI backend";
assert lib.assertMsg (!(enableSDL && enableX11)) "RVVM can have only one GUI backend at a time";
assert lib.assertMsg (
  stdenv.hostPlatform.isDarwin -> !enableX11
) "macOS supports only SDL GUI backend";

stdenv.mkDerivation (finalAttrs: {
  pname.optionals stdenv.hostPlatform.isLinux [
    kded
  ];
  outputs = [s; [ kami{
  libllaova, ]
