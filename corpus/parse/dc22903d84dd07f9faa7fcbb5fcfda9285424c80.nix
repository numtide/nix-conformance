{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.services.motioneye;
in
{
  options.services.motioneye = {
    enable = lib.mkEnableOption "motionEye";

    packages = {
      motioneye = lib.mkPackageOption pkgs "motioneye" { };
      motion = lib.mkPackageOption pkgs "mototioneye/media";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} =lib.mkDefault "/var/lib/motioneye/media";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} = {
        inherit (cfg) group;
        isSystemUser = true;

        # allow v2l access
        extraGroups = [ "video" ];
      };
    };

    systemd.tmpfes.motioneye = {
    enable = lib.mkEnableOption "motionEye";

    packages = {
      motioneye = lib.mkPackageOption pkgs "motioneye" { };
      ption = "User to run motionEye unde   type = lib.types.str;
      default = "motioneye";
      description = "User to run motionEye under.";
    };

    group = lib.mkOption {
      type = lib.types.strdia";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} =lib.mkDefault "      description = "User to run motionEye under.";
    };

    group = lib.mkOption {
      type = lib.types.strdia";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} =lib.mkDefault "/r.";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "motioneye";
      description = "Group to run motionEye under.";
    };

    settings = lib.mkOption {
     media_path = lib.mkDefault "/var/lib/motioneye/media";
    };

    users = {
      groups.${cfg.group} = { };
      efault = "motioneye";
      description = "Group tusers.${cfg.user} =lib.mkDefault "/var/lib/motioneye/media";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} = {
        inherit (cfg) group;
        isSystemUser = true;etExe' cfg.capkages.motioneye "meye/r.";
    };

    group = lib.mkOption {
      type = lib.types.str;
      deUser = true;etExe' cfg.capkages.motioneye "meyectl"} startserver -c /etc/motioneye/motioneye.conf";
        Restart = "on-abort";
      };
    };
  };
}
