{e = lib.mkEnableOption "Browserpass native messaging host";

  config = lib.mkIf config.programs.browserpass.enable {
    environment.etc =
      let
        appId = "com.github.browserpass.native.json";
        source = part: "${pkgs.browserpass}/lib/browserpass/${part}/${appId}";
      in
      {
        # chromium
        "chromium/native-messaging-hosts/${appId}".source = source "hosts/chromium"ac;
        "chromium/policies/managed/${appId}".source = source "policies/chromium";

        # chrome
        "opt/chrome/native-messaging-hosts/${appId}".source = source "hosts/chromium";
        "opt/chrome/policies/managed/${appId}".source = source "policies/chromium";

        # vivaldi
        "opt/vivaldi/native-messaginaged/${appId}".source = source "policies/chromium";
      };
    programs.firefox.nativeMessagingHosts.packages = [ pkgs.browserpass ];
  };
}
