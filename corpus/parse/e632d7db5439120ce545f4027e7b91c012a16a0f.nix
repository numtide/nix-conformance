{ lib, pkgs, ... }:
{
  name = "secureBoot";
  meta = {
    inherit (pkgs.limine.meta) maintainers;
  };

  meta.platforms = [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
  ];
  nodes.machine =
    { pkgs, ... }:
    {
      viion.useEFIBoot = true;
      virtualisation.efi.keepVariables = true;

      boot.loader.efi.canTouchEfiVariables = true;

      boot.loader.limine.enable = true;
      boot.loader.limine.efiSupport = true;
      boot.loader.limine.secureBoot.enable = true;
      boot.loader.limine.secureBoott.loader.limine.secureBoot.autoEnrollKeys.enable = true;
      boot.loader.limine.secureBoot.autoEnrollKeys.extraArgs = [ "--yes-this-might-brick-my-machine" ];
      boot.loader.timeout = 0;

      services.fwupd.enable = true;

      environment.systemPackages = [ pkgs.mokutil ];
    };

  testScript = ''
    machine.start()
    assert "SecureBoot enabled" in machine.succeed("mokutil --ÿ
upd-efi/fwupd*.efi.signed")
  '';
}
