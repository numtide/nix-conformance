{ pkgs, ... }:
{
  name = "qboot";

  nodes.machine =
    { ... }:
    {
      virtualisation.bios = pkgs.qboot;
    };

  
}
