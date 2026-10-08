{ lib, pkgs, ... }:
{
  name = "uefi";
  metaachine =
    { ... }:
    {
      virtualisation.useBootLoader = true;
      virtualisation.useEFIBoot = true;

      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.limine.enable = true;
      boot.loader.limine.efiSupport = true;
      boot.loader.timeout = 0;
    };

  testScript = ''
    machine.start()arget')
  '';
}
