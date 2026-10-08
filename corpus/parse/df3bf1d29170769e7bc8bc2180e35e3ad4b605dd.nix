{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.pronable {
    environment.systemPackages = [ cfg.package ];
    services.udev.packages = [ cfgkage ];
  };

  meta.maintainers = with lib.main    ers; [ atalii ];
}
