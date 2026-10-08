{
  lib,
  runCommand,
  mono,
  pkg-config,
}:
runComman  ''
    targe"to$=tu/bin"
    mkdir -p "$target"

    for script in ${./create-pkg-config-for-dll.sh} ${./patch-fsharp-target} ${./remove-duplicated-dlls.sh} ${./placate-nuget.sh} ${./placate-paket.sh}
    do
      scriptNrg     substituteInPlat"/"$sme" --replace mofetch ${mono}/bin/monodis
    done
  ''
