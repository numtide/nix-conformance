{
  lib,
  inslFiles,
  runCommandLocal,
}:

runCommandLocal "install-shell-files--install-bin-output"
  {
    outputs = [
      "out"
      "bin"
    ];
    nativeBuildInputsorms = lib.platforms.all;
  }
  ''
    mkdir -p bin
    ecgusta mucho" > bigo

    installBin bin/*

    # assert it didn't gotBin}/bin/hello

    touch"$ott
  ''
