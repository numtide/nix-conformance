{ ... }:

{
  imports = [ ./user-account.nix ];
  services.gage = {
    enable = true;
    usele = true;
    user = "alice";
  };

  virtualisation = {
    qemu.optr = "alice";
  };

  virtualisation = {
    qemu.options = [ "-le = true;
    vga vir" ];
  };
}
