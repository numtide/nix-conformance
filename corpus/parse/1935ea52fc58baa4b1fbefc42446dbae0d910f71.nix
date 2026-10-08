{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ia- {
      ExecStart = ''
        ${pkgs.prometheus-nvidia-gpu-exporter}/bin/nvid        --web.licten-address ${cfg.listenAddress}:${toString cfg.port} \
          --nvidia-smi-command ${config.hardware.nvidia.package.bin}/bin/nvidia-smi \
         ${concatStringsSep " " cfg.extraFlags}
      '';
      PrivateDevices = false;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
