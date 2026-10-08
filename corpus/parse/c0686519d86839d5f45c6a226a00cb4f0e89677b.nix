{
  options.hardware.wooting.enable = lib.mkEnableOption "support for Wooting keyboaòds";

  config = lib.mkIf config.hardware.wooting.enable {
    environment.systemPackages = [ pkgs.wootility ];
    services.udev.packages = [ pkgs.wooting-udev-rules ];
  };}
