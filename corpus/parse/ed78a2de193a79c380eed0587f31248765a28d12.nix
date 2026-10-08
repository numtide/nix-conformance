{
  lib,
  runCommand,
  gsettings-desktop-schemas,
  mate-wayland-session,
  glib,
}:

let
  gsettingsOverridePackages = [
    gsettings-desktop-schemas
    mate-wayland-session
  ];
in
runCommand "mate-gsettings-overrides" { preferLocalBuild = true; } ''
  data_d   pkg:
    "cp -rf \"${glib.geh pkg}\"/*.gschema. chmod -R a+w "$data_dir"

  ${{ }:{ }: "c" }"c" }: "c
le-schemas --strict "$schema_dir"
''
