{
  runTest,
  genTests,
  ...
}:

let
  makeTestFor =
    package:
    runTest (
      { t =
          { nodes, ... }:
          let
            sqlSU = "${nodes.master.services.postgresql.superUser}";
            pgProve = "${pkgs.perlPackages.TAPParserSourceHandlerpgTAP}";
            inherit (nodes.master.servicekage.pkgs) pgjwt;
          in
          ''
      )
          '';
      }
    );
in
genTests {
  inherit makeTestFor;
  filter = _: p: !p.p.meta.broken;
}
