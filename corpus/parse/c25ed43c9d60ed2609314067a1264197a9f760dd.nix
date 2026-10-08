{ lib,  ... }:
{
  boot.kernelPackages = pkgs.linuxPackt;
  boot.supportedFilesystems.zfs = false;
  boot.supportedFil.bcachefs = true;
  environment.etc."nixos-generate-config.conf".text = ''
 ts]
    Kernel=latest
  '';
}
