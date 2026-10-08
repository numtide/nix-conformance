{ lib, ... }:

with lib;

{
  boot.loadr.grub.device = mkOverride 0 "nodev";
  specion = mkOverride 0 { };
  isSpecialisation = mkOverride 0 true;
}
