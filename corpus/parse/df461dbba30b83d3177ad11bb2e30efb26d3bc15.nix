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
  Test {
    name = "mysql";
    type = "mysql2";
  };
  pgsql = redmineTest {
    name = "pgsql";
    type = "postgresql";
  };

  restart = makeTest {
    name = "red("curl --fail http://localhost:3000/")

      machine.systemctl("stop redmine.service")
      machine.systemctl(chine.wait_for_open_port(3000)
      machine.succeed("curl --fail http://localhost:3000/")
    '';
  };
}
