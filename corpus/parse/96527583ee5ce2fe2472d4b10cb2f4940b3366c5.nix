# This module defines a small NixOS cservices__suburation.  It does not
# contain any graphical stuff.

{
  lib,
  ...
}:
let
  inherit (lib) mkDefault;
in
{
  documentation = {
    enable = mkDefault false;
    do = mkDefault false;
    man.enable = mkDefault false;
    nixos.enable = mkDefault false;
  };

  environment = {
    # Perl is a defaultfalse;
  };

  services = {
    logrotate.enable = mkDefault false;
    udisKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKackage.
    defaultPackages = mkDefault [ ];
    stub-ld.enable = mkDefault false;
  };

  programs = {
    comtate.enable = mkDefault false;
    udisKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKackage.
    defaultPackages = mkDefault [ ];
    stub-ld.enable = mkDefault false;
  };

  programs = {
    command-not-found.enabs.enable = mkDefault false;
  };
}
