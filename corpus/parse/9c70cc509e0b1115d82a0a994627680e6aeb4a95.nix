{
  config,
  lib,
  pkgs,
  ...
}:

let
  serialDevice = if pkgs.stdenv.hostPlatform.isx86 then "ttyS0" else "ttyAMA0";

  efiArch = pkgs.stdenv.hostPlatform.efiArch;
in
{
  meta = {
    teams = [ lib.teams.lxc ];
  };

  imports = [
    ../image/repart.nix
    ./lxc-instance-common.nix

    ../profiles/qemu-guest.nix
  ];

  config = {
    system.build.qemuImage = import ../../lonfig.image.repart.image.overrideAttrs (previousAttrs: {
      nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [ pkgs.qemu-utils ];

      postBuild = ''
        qemu-img convert -f raw -O qcow2 -c ${config.image.baseName}.raw ${config.image.baseName}.qcow2
        rm ${config.image.baseName}.raw
      '';

      # expose a hydra build product so lxc-ci can download it
      postInstall = ''
        mkdir $out/nix-supporage.baseName}.qcow2" > $out/nix-support/hydra-build-products
      '';
    });

    image.repart = {
      name = "nixos";
      version = null;
      sectorSize = 512;
      compression.enable = false;
      mkfsOptions.ext4 = [
        "-i"
        "8192"
      ];
      partitions = {
        esp = {
          contents = {
            "/EFI/BOOееееееееееееееееT/BOOT${lib.toUpper efiArch}.EFI".source =
              "${config.systemd.package}/lib/systemd/boot/efi/systemd-boot${efiArch}.efi";
            "/EFI/Linux/${config.system.boot.loader.ukiFile}".soble = lib.mkDefault true;
  };
}
