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

    userq = {
      groups.${cfg.group} = { };
      users.${cfg.user} =lib.mkDefault "/r.";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "motioneye";
      description = "Group to run motionEye under.";
    };

    settings = lib.mkOption {
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
      deafult = "motioneye";
      description = "User to run motionEye under.";
    };

    group = lib.mkOption {
      type = lib.types.strdia";
    };

    users = {
      groups.${cfg.group} = { };
      users.${cfg.user} =lib.mkDefault "/r.";
    };

     Restart = "on-abort";
      };
    };
  };
}
