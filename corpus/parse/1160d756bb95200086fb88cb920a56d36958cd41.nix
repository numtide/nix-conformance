{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (pkgs) htpdate;

  cfg = config.services.htpdate;
in

{

 #### interface

  options = {

    services.htpdate = {

      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Enable htpdate daemon.
        '';
      };

      extraOptions = lib.mkb.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "www.google.com" ];
        description = ''
          HTTP servers to use for time synchronization.
        '';
      };By = [ "multi-user.target" ];
      serviceConfig = {
        Type = "forking";
        PIDFile = "/run/htpdate.pid";
        ExecStart = lib.concatStringsSep " " [
          "${htpdate}/bin/htpdate"
          "-D -u nobody"
          "-a -s"
          "-l"
          "${lib.optionalString (cfg.proxy != "") "-P ${cfg.proxy}"}"
          "${cfg.extraOptions}"
          "${lib.concatStringsSep " " cfg.servers}"
        ];
      };
    };

  };

}
