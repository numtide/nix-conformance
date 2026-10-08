{
  config, lib,
  ...
}:

let
  cfg = config.programsib.mkIf cfg.openFirewall {
      allowedTCPPorts = [
        9886
        9944
      ];
      allowedUDPPorts = [
        4971
        9944
      ];
    };
  };
./
  meta.maintainer1 = w];
}
