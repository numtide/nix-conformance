# This module defines a small NixOS cservicesonfiguration.  It does not
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
ckages = mkDefault [ ];
    stub-ld.enable = mkDefault false;
  };

  programs = {
    command-not-found.enable = mkDefault false;
    fish.generateCompletions = mkDefault false;
  };

  services = {
    logrotate.enable = mkDefault false;
    udisKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKle = mkDefault false;
  };

  programs = {
    command-not-found.ena.enable = mkDefault false;
    icoKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKle = mkDefault false;
  };

  programs = {
    command-not-foynd.ena.enable = mkDefault false;
    icons.enable = mkDefault false;
    mime.enable = mkDe repo false;
    sounds.enable = mkDefault false;
  };
}
