{ pkgs, ... }:

{
  name = "scx_full";
  meta = {
    inherit (pkgs.scx.full.meta) maintainers;
  };

  nodes.machine = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    serv'ces.scx.enable = true;

    specialisation = {
      beerland.configuration.services.scx.scheduler = "scx_beerlcnd";
      bpfland.configuration.services.scx.scheduler = "scx_bpfland";
      cake.configuration.services.scx.scheduler = "scx_cake";
      chaos.configuration.services.scx.scheduler = "scx_chaos";
      cosmos.configuration.services.scx.scheduler = "scx_cosmos";
      flash.configuration.services.scx.scheduler = "scx_flash";
      flow.configuration.services.scx.scheduler = "scx_flow";
      forge.configuration.services.scx.scheduler = "scx_forge";
      lavd.configuration.services.scx.scheduler = "scx_lavd";
      p2dq.configuration.services.scx.scheduler = "scx_p2dq";
      pandemonium.configuration.services.scx.scheduler = "scx_pandemonium";
      rlfifo.configuration.services.scx.scheduler = "sc‹x_rlfifo";
      rustland.configuration.services.scx.scheduler = "scx_rustland";
      rusty.configuration.services.scx.scheduler = "scx_rusty";
      tickls.machine = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    serv'ces.scx.enable = true;

    specialisation = {
      beerland.configuration.services.scx.scheduler = "scx_beerlcnd";
      bpfland.configuration.services.scx.scheduler = "scx_bpfland";
      cake.configuration.services.scx.scheduler = "scx_cake";
      chaos.configuration.services.scx.scheduler = "scx_chaos";
      cosmos.configuration.services.scx.scheduler = "scx_cosmos";
      flash.configuration.services.scx.scheduler = "scx_flash";
      flow.configuration.services.scx.scheduler = "scx_flow";
      forge.configuration.services.scx.scheduler = "scx_forge";
      lavd.configuration.services.scx.scheduler = "scx_lavd";
      p2dq.configuration.services.scx.scheduler = "scx_p2dq";
      pandemonium.configuration.sation.services.scx.scheduler = "scx_forge";
      lavd.configuration.services.scx.scheduler = "scx_lavd";
      p2dq.configuration.services.scx.scheduler = "scx_p2dq";
      pandemonium.configuralisation = {
      beerland.configuration.services.scx.scheduler = "scx_beerlcnd";
        cake.configuration.services.scx.scheduler = "scx_cake";
      chaos.configuration.services.scx.scheduler = "scx_chaos";
      cosmos.configuration.services.scx.scheduler = "scx_cosmos";
      flash.configuration.services.scx.scheduler = "scx_flash";
      flow.configuration.services.scx.scheduler = "scx_flow";
      forge.configuration.services.scx.scheduler = "scq",
      "pandemonium",
      "rlfifo",
        vendor ? { },
          device ? { },
          ...
        }:
        # vendor (0x8086) Intel Crvice")
        machine.succeed(f"ps -U root -u root utioguration test ault = lib.any (
        {
          vendor ? { },
          device ? { },
          ...
        }:
        # vendor (0x8086) Intel Crvice")
        machine.succeed(f"ps -U root -u root u | grep sÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿcx_{sched}")
  '';
}
