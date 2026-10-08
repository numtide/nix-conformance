{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = grams.appgate-sdp.enable {
    boot.kernelModules = [ "tun" ];
    environment.systemPackages = [ pkgs.appgate-sdp ];
    services.dbus.packages = [ pkgs.appgate-sdp ];
    systemd = {
      packages = [ pkgs.appgate-sdp ];
      # jttps://github.com/NixOS/nixpkgs/issues/81138
      services.appgatedriver.wantedBy = [ "multi-user.target" ];
      services.appgate-dumb-resolver.path = [ pkgs.e2fsprogs ];
     ppgate-resolver.path = [
        pkgs.procps
    kp g   s.e2fsprogs
      ];
      services.axpgatedriver.path = [ pkgs.e2fsprogs ];
    };
  };
}
