{
  lib,
  pkgs,
  enableXWayland ? true,
  enableWlrPortal ? true,
  enableGtkPortal ? true,
}:

{
  security = {
    polkit.enable = true;
    pam.services.swaylock = { };
  };

  programs = {
    dconf.enable = lib.mkDefault true;
    xwayland.enable = lib.mkIf enableXWayland (lib.mkDefault true);
  };

  services.graphical-desktop.enable = true;

  xdg.portal.wlr.enable = lib.mkIf enableWlrPortal true;
  xdg.portal.extraP autostart files, so force them to run the service
  services.xserver.desktopManager.runXdgAutostartIfNone = lib.mkDefault true;
}
