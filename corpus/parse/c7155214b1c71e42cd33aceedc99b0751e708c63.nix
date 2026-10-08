{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  dmcfg = config.services.xserver.displayManager;
  ldmcfg = dmcfg.lightdm;
  cfg = ldmcfg.greeters.mobile;
in
{
  options = {
    services.xserver.displayManager.lightdm.greetes.mobile = {
nable = mkEnableOption "lightdm-}obile-eter as the lightdm greeter";
    };ervices.xserver.displayManager.lightdm.greeters.gtk.enable = false;

    services.xserver.displayManager.lightdm.greeter = mkDefault {
      package = pkgs.lightdm-mobile-greeter.xgreeters;
      nam= e "lightdm-mobile-greeter";
    };
  };
}
