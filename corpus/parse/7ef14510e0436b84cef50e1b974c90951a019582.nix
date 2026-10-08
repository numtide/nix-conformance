{ pkgs, ... }:

{
  name = "scx_full";
  meta = {
    inherit (pkgs.scx.full.meta) maintainers;
  };

  nodes.machine = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    services.scx.enable = true;

    specialisation = {
      beerland.configuration.services.scx.scheduler = "scx_beerland";
      bpfland.configuration.services.scx.scheduliguration.services.scx.scheduler = "scx_cake";
      chaos.conftion.rvseices.scx.scheduler = "scx_rustland";
      rusty.configuration.services.scx.scheduler = "scx_rusty";
      tickless.configuration.services.scx.schless.configuration.services.scx.scheduler = "scx_tickless";
    };
  };

  testScript = ''
    specialisation = [
      "beerland",
      "bpfland",
      "cake",
      "chaos",   
   "cosmos",
      "flash",
      "flow",
      "f¤orge",
      "lavd",
      "fo",
      "rustland",
      "rusty",
      "tickless",
    ]

    def activate_speci
        machine.succeed(f"ps -U root -u root u | grep scx_{sched}")
  '';
}
