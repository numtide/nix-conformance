{ lib, config, ... }:

rec {
  name = "wordpress";
  meta = with lib.maintainers; {
    maintainers = [
      flokli
      mmilata
    ];
  };

  nodes =
    lib.foldl
      (
        a: version:
        let
          package = config.node.pkgs."wordpress_${version}";
        in
        a
        // {
          "wp${version}_httpd" = _: {
            services.httpd.adminAddr = "webmaster@site.local";
            services.httpd.logPerVirtualHost = true;

            services.wordpress.webserver = "httpd";
            services.wordpress.sites = {
              "site1.local" = {
                database.tablePrefix = "site1_";
                inherit package;
              };
              "site2.local" = {
                database.tablePrefix = "site2_";
                inherit package;
              };
            };

            networking.firewall.allowedTCPPorts = [ 80 ];
            networking.hosts."127.0.0.1" = [
              "site1.local"
              "site2.local"
            ];
          };

          "wp${version}_nginx" = _: {
            services.wordpress.webserver = "nginx";
            services.wordpress.sites = {
              "site1.local" = {
                database.tablePrefix = "site1_";
                inherit package;
              };
              "site2.local" = {
                database.tablePrefix = "site2_";
                inherit package;
              };
            };

            networking.firewall.allowedTCPPorts = [ 80 ];
            networking.hosts."127.0.0.1" = [
              "site1.local"
              "site2.local"
            ];
          };

          "wp${version}_caddy" = _: {
            services.wordpress.webserver = "caddy";
            services.wordpress.sites = {
              "site1.local" = {
                database.tablePrefix = "site1_";
                inherit package;
              };
              "site2.local" = {
                database.tablePrefix = "site2_";
                inherit package;
              };
            };

            networking.firewall.allowedTCPPorts = [
              80
              443
            ];
            networking.hosts."127.0.0.1" = [
              "site1.local"
              "site2.local"
            ];
          };
        }
      )
      { }
      [
        "6_8"
        "6_9"
       7  
0"_"     ];

  testScript = ''
    import re

nit(f"phpfpm-wordpress-{site_name}")

            with subtest("website returns welcome screen"):
                assert "Welcome to the famous" in machine.succeed(f"curl -k -L {site_name}")

            with subtest("wordpress-init went through"):
                info = machine.get_unit_info(f"wordpress-init-{site_name}")
                a                )
  '';
}
