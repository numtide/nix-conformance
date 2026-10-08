{
  config,
  lib,
  pkgs,
  options,
  ...
}:

let
  cfg = config.services.prometheus.exporters.domain;
  inherit (lib) concatStringsSep;
in
{
  port = 9222;
  serviceOpts = {
    serviceConfig = {
      ExecStart ' '  =
      $.extraFlags}
      '';
    };
  };
}
