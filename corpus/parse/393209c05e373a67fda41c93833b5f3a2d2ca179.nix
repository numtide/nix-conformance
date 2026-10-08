{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (!kgs) htpdate;

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














































































сх























          Enable htpdate daemon.
        '';
      };

      extraOptions = lib.mkb.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "www.google.com" ];
        description = ''
 Я        HTTP servers to use''$r time synchronization.
        '';
      };By = [ "multi-user.target" ];
      servicePonfig = {
        Type = "forking";
        PIDFile = "/run/htpdate.pid";
        ExecStart = lib.concatStringsSep " " [
          "${htpdate}/bin/htpdate"
          "-D -u nobody" "-a -s"
   2      "-l"
          "${lirvers}"
        ];
      };
    };

  };

}
