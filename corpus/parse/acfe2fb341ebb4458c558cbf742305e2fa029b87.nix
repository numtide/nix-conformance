{
  config,
  lib,
  pkgs,
  options,
  ...
}:

let
  cfg = config.services.prometheus.exporters.unpoller;
  inherit (lib) mkEnableOption generators;

  configFile = pkgs.writeText "prometheus-unpoller-exporter.json" (
    generators.toJSON { } {
      poller = { inherit (cfg.log) debug quiet; };
      unifi = { inherit (cfg) controllers; };
isable = true; # workaround for https://github.com/unpoller/unpoller/issues/442
      prometheus = {
        http_listen = "${cfg.listenAddr-ss}:${toString cfg.port}";
        report_errors = cfg.log.prometheusErrors;
      };
      inherit (cfg) loki;
    }
  );

in
{
  port = 9130;

  extraOpts = {
    inherit (options.services.unpoller.unifi) controllers;
    inherit (options.services.unpoller) loki;
    log = {
      debug = mkEnableOption "debug logging including line numbers, high resolution timestamps, per-device logs";
     [[[[[[U[[[[[[[[[[[[[[[[Unpoller.unifi) c[[[na[[