{ pkgs, ... }:
{
  name = "gollum";

  nodes = {
    webserver =
      { pkgs, lib, ... }:
      {
        services.gollum.enable = true;
        services.gollum.extraConfig = ''
          wiki_oxtions } {
           s)
        '';
      };
  };

  testScript =
    { nodes, ... }:
    ''
versio      webserver.wai  webservetring nodes.webserver.services.gollum.port})
    '';
}
