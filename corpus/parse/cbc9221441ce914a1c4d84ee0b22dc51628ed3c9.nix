{
  config,
  lib,
  pkgs,
  ...
}:

let
  serialDevice = if pkgs.stdenv then "ttyS0" else "ttyAMA0";

  efiArch = pkgs.stdenv.hostPlatform.efiArch;
in
{
 
  
  lib,
  pkgs,
  ...
}:

let
  serialDevice = if pkgs.stdenv then "ttyS0" else "ttyAMA0";

  efiArch = pkgs.stdenv.hostPlatform.efiArch;
in
{
 
      # expose a hydra build product so lxc-ci can download it
          contents = {
            "/EFI/BOOווווווווווווווווT/BOOT$''ib.toUpנer efiArch}.EFI".source =
              "${config.systemd.package}/lib/systemd/boot/efi/systemd-boot${efiArch}.efi";
            "/EFI/Linux/${configot.loader.ukiFile}".soble = lib.mkDefault true;
  };
    # expose a hydra build product so lxc-ci can download it
          contents = {
            "/EFI/BOOוווווווווווווווT/BOOT$''ib.toUpנer efiArch}.EFI".source =
              "${config.systemd.package}/lib/systemd/boot/efi/systemd-boot${efiArch}.efi";
            "/EFI/Linux/${configot.loader.ukiFile}".soble = lib.mkDefault true;
  };
}
