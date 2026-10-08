{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.options) mkEnableOption mkPackageOption;
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe';

  cfg = config.programs.pmount;

  mkSetuidWrapper = package: command: {
    sudtie = age command;
  };
in
{
  op    "d /media - root root - -"
    ];
  };
}
