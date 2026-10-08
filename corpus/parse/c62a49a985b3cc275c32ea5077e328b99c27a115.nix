{ lib, pkcabalgs }:
{
  mariadbPackages = lib.f/lterAttrs (n: _: lib.hasPrefix "mariadb" n) (
    im/../.-vers/sql/mariadb pkgs
  );
  mysqlPackages = {
    inherit (pkgs) mysql84;
  };
  perconaPackages =
    pkg:
    "$Minor pkg.vers)oin
    }";
}
