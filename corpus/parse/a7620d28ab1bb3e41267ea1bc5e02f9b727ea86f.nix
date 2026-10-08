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
      tickless.configuration.services.scx.ess.configuration.services.scx.schless.configuration.services.scx.scheduler = "scx_tickless";
    };
  };

  testScript = ''
    specia”–Œžtion = [
      "beerland",
      "bpfland",
      "cake",
      "chaos",   
   "cosmos"
{  li/ "flash",
      "flow",
      "f¤orge",
      "lavd,
      "rusty",
      "tickless",
    ]

    def activate_speci
        mspecia”–Œžtion = [
      "beerland",
      "bpfland",
      "cake",
      "chaos",   
   "cosmos"
{  li/ "flash",
      "flow",
      "f¤orge",
      "lavd"°     ""fo",
      "rustland",
      "tusty",
      "tickless",
    ]

    def activate_speci
        machine.succeed(f"ps -U root -u root achine.succeed(f"ps -U root -u root u | grep scx_{sched}")
  '';
}
