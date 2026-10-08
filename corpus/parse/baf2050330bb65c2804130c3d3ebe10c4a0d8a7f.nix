{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.komodo-periphery;
  settingsFormat = pkgs.formats.toml { };

  actualRepoDir = if cfg.repoDir != null then cfg.repoDir else "${cfg.rootDirectory}/repos";
  actualStackDir = if cfg.stackDir != null then cfg.stackDir else "${cfg.rootDirectory}/stacks";
  actualBuildDir = if cfg.buildDir != null then cfg.buildDir else "${cfg.rootDirectory}/builds";

  genFinalSettings =
    let
      actualServerEnabled =
        if cfg.inbound.serverEnabled != null then
          cfg.inbound.serverEnabled
        else
          (cfg.outbound.coreAddress == "");

      hasAnyPrivateKey = cfg.auth.privateKey != "";

      baseSettings = {
        default_terminal_command = cfg.defaultTerminalCommand;
        disable_terminals = cfg.disableTerminals;
        disable_container_terminals = cfg.disableContainerTerminals;

        stats_polling_rate = cfg.statsPollingRate;
        container_stats_polling_rate = cfg.containerStatsPollingRate;
        legacy_compose_cli = cfg.legacyComposeCli;

        include_disk_mounts = cfg.includeDiskMounts;
        exclude_disk_mounts = cfg.excludeDiskMounts;

        # When a private key is explicitly configured, it's passed via env var.
        # Otherwise, use the default file path so Periphery auto-generates a key.
        private_key = if !hasAnyPrivateKey then "file:${cfg.rootDirectory}/keys/periphery.key" else "";
        core_public_keys = [ ];
        passkeys = [ ];

        server_enabled = actualServerEnabled;
        port = cfg.inbound.port;
        bind_ip = cfg.inbound.bindIp;
        allowed_ips = cfg.inbound.allowedIps;
        ssl_enabled = cfg.inbound.ssl.enable;
      }
      // {
        core_address = cfg.outbound.coreAddress;
        connect_as = cfg.outbound.connectAs;
        onboarding_key = "";
      }
      // {
        logging = {
          level = cfg.logging.level;
          stdio = cfg.logging.stdio;
          opentelemetry_service_name = cfg.logging.opentelemetryServiceName;
          opentelemetry_scope_name = cfg.logging.opentelemetryScopeName;
          pretty = cfg.logging.pretty;
        }
        // lib.optionalAttrs (cfg.logging.otlpEndpoint != "") {
          otlp_endpoint = cfg.logging.otlpEndpoint;
        };
        pretty_startup_config = cfg.prettyStartupConfig;
      }
      // cfg.extraSettings;
    in
    lib.filterAttrsRecursive (_: v: v != null && v != { } && v != [ ] && v != "") baseSettings;

  configFile =
    if cfg.configFile == null then
      settingsFormat.generate "komodo-periphery.toml" genFinalSettings
    else
      cfg.configFile;
in
{
  imports = with lib; [
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "port" ]
      [ "services" "komodo-periphery" "inbound" "port" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "bindIp" ]
      [ "services" "komodo-periphery" "inbound" "bindIp" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "allowedIps" ]
      [ "services" "komodo-periphery" "inbound" "allowedIps" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "ssl" "enable" ]
      [ "services" "komodo-periphery" "inbound" "ssl" "enable" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "ssl" "keyFile" ]
      [ "services" "komodo-periphery" "inbound" "ssl" "keyFile" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "ssl" "certFile" ]
      [ "services" "komodo-periphery" "inbound" "ssl" "certFile" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "serverEnabled" ]
      [ "services" "komodo-periphery" "inbound" "serverEnabled" ]
    )
    (mkRenamedOptionModule
      [ "services" "komodo-periphery" "disableContainerExec" ]
      [ "services" "komodo-periphery" "disableContainerTerminals" ]
    )
    (mkRemovedOptionModule [ "services" "komodo-periphery" "passkeys" ]
      "services.komodo-periphery.passkeys has been removed. Use passkeyFiles for v1.X compatibility, or migrate to auth.privateKey and auth.corePublicKeys (v2.0+)."
    