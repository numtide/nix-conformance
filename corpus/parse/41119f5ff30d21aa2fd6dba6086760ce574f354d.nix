{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.services.lxd-image-server;
  format = pkgs.formats.toml { };

  location = "/ver";

      group = lib.mkOption {
        type = lib.types.str;
        description = "Group assigned to the user and the webroot directory.";
        default = "nginx";
        example = "www-data";
      };

      settings = libkIf (cfg.enable) {
      users.users.lxd-image-server = {
     eACME = lib.mkDefault true;

          root = location;

          locations = {
            "/streams/v1/" = {
              index = "index.json";
            };

            # Serve json files with content type header application/json
            "~ \\.json$" = {
              extraConfig = ''
                add_header Content-Type application/json;
              '';
            };

            "~ \\.tar.xz$" = {
              extraConfig = ''
                add_header Content-Type application/octet-stream;
              '';
            };

            "~ \\.tar.gz$" = {
              extraConfig = ''
                add_header Content-Type application/octet-stream;
              '';
            };

            # Deny access to document root and the images folder
            "~ ^/(images/)?$" = {
              return = "404";
            };
          };
        };
      };
    })
  ];
}
