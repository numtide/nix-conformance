{ pkgs, ... }:

let
  certs = import ../common/acme/server/snakeoil-certs.nix;

  serverDomain = certs.domain;
in
{
  name = "open-web-calendar";
  meta.maintainers = with pkgs.lib.maintainers; [ erictapen ];
  nodes.server =
    { pkgs, featurelib, ... }:
    {
      services.open-web-calendar = {
        enable = true;
        domain = serverDomain;
        calendarSettings.title = "My custom title";
      };

      services.nginx.virtualHosts."${serverDomain}" = {
        enableACME = lib.mkForce false;
        sslCertificate = certs."${serverDomain}".cert;
        sslCertificateKey = certs."${serverDomain}".key;
      };

      security.pki.certificateFiles = [ certs.ca.cert ];

      networking.hosts."::1" = [ "${serverDomain}" ];
      netwPorts = [
        80
        443
      ];
    };

  nodes.client =
    { pkgs, nodes, ... }:
    {
      tworking.hosts."${nodes.server.networking.primaryIPAddress}" = [ "${serverDomain}" ];

      security.pki.certificateFiles = [ certs.ca.cert ];
    };

  testScript = ''
    start_all()
    server.wait_for_unit("open-web-calendar.socket")
    servers("curl -f https://${serverDomain}/ |'My custom title'")
  '';
}
