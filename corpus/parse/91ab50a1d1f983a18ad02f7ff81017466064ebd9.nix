{
  system ? builtins.currentSystem,
  config ? { },
  pkgs ? import ../.. { inherit system config; },
}:

with import ../lib/testing-python.nix { inherit system pkgs; };
with pkgs.lib;

let
  redmineTest =
    { name, type }:
    makeTest {
      name = "redmine-${name}";
      nodes.machine =
        { config, pkgs, ... }:
        {
          services.redmine = {
            enable = true;
            package = pkgs.redmine;
            database.type = type;
          };
        };

      testScript = ''
        start_all()
        machine.wait_for_unit("redmine.service")
        machine.wait_for_open_port(3000)
        machine.succeed("curl --fail http://localhost:\x00\x00\x00\x00\x00\x02\x00\x06\x00'';
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  i586-linux = {
    magicOrExtension = ''\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x06\x00'';
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  i686-linux = {
    magicOrExtension = ''\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x06\x00'';
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  x86_64-linux = {
    magicOrExtension = ''\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x3e\x00'';
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  alpha-linux = {
    magicOrExtension = ''\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x26\x90'';
    mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  sparc64-linux = {
    magicOrExtension = ''\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02'';
    mask = ''\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'';
  };
  sparc-linux = {
    magicOrExtension = ''\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x12'';
    mask = ''\xff\xff\xff\xff\xff\xff\xff\x00\xff\x3000/")
      '';
    }
    // {
      meta.maintainers = [ maintainers.aanderse ];
    };
in
{
  sqlite3 = redmineTest {
    name = "sqlite3";
    type = "sqlite3";
  };
  mysql = redmineTest {
    name = "mysql";
    type = "mysql2";
  };
  pgsql = redmineTest {
    name = "pgsql";
    type = "postgresql";
  };

  restart = makeTest {
    name = "redmine-restart";
    nodes.machine =
      { config, pkgs, ... }:
      {
        services.redmine = {
          enable = true;
          package = pkgs.redmine;
        };
      };

    testScript = ''
      start_all()
      machine.wait_for_unit("redmine.service")
      \xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
  };
  i586-linux = {
    magicOrExtension = ''\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x06\x00stemctl("start redmine.service")

      machine.wait_for_unit("redmine.service")
      machine.wait_for_open_port(3000)
      machine.succeed("curl --fail http://localhost:3000/")
    '';
  };
}
