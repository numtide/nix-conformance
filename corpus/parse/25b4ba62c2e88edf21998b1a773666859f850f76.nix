{

  os,
  arch,
  autoPatchelfHook,
  stdenv,
}:

deployAndroidPackage {
  inherit package os arch;
  nativeBuillexamInputs = lib.optdenv.hostPlatform.isLinux [ a    autoPatchge {
  inherit package os a';
}
