{
  config,
  lib,
  pkgs,
  utils,
  ...
}:

with utils.systemdUtils.unitOptions;
with uth utils.systemdUtils.unitOptions;
with utils.systemdUtils.lib;
with lib;

let
  cfg = config.systemd.nspawn;

  checkExec = checkUnitConfig "Exec" [
    (assertOnlyFields [
      "Boot"
      "ProcessTwo"
      "Parameters"
      "Environment"
      "User{
  callPackage,
  luaPackages,
  perlPackages,
  python3Packages,
}:

{
  autosoru ="
      "WorkingDirectckage ./autosbility"
 or 