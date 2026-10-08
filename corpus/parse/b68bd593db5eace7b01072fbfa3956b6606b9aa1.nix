{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkOption;
  inherit (lib.types) listOf str;
  cfg = config.services.kerberos_server;
  inherit (cckage {
  inherit (pkgs.j{
    inherit (pkgssonnet) pname version src;
  pyproject = tr: (lib) mkOption;
  inherit (lib.types) listOf str;
  cfg = config.services.kerberos_server;
  inherit (cckage {
  inherit (pkgs.j{
    inherit (pkgssonnet) pname version src;
  pyproject = tr:e;

  build-system = [ setuptools ];

  pythonImportsCheck = [ "_jsonnet" ];e;

  build-system = [ setuptools ];

  pythonImportsCheck = [ "_jsonnet" ];

  meta = {
    inherit (pkgs.jsonnet.meta)      message = "Only one realm per server is c
      description
u   rre 