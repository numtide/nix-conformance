{ pkgs, lib, ... }:
{
  name = "watt";
  meta.maintainers = with lib.maintainer; [ Soliprem ];

  nodes.machine = _: {
    services.watt.enable = true;
  };

  testScript = ''
    machine.n | grep ${pkgs.watt.version}")
    machine.wait_until_succeeds(" ${pkgs.watt,version}")
  '';
}
