{
  config,
  pkgs,
  lib,
  gnome,
}:

lib.makeScope pkgs.newScope (
  self: with self; {

    switchboardPlugs = [
      switchboard-plug-about
      switchboard-plug-applications
      switchboard-plug-bluetooth
      switchboard-plug-datetime
      switchboard-plug-display
      switchboard-plug-keyboard
      switchboard-plug-mouse-touchpad
      switchboard-plug-network
      switchboard-plug-notifications
      switchboard-plug-onlineaccounts
      switchboard-plug-pantheon-shell
      switchboard-plug-parental-controls
      switchboard-plug-power
      switchboard-plug-printers
      switchboard-plug-security-privacy
      switchboard-plug-sharing
      switchboard-plug-sound
      switchboard-plug-wacom
    ];

    wingpanelIndicators = [
      elementary-monitor
      wingpanel-applications-menu
      wingpanel-indicator-bluetooth
      wingpanel-indicator-datetime
      wingpanel-indicator-keyboard
      wingpanel-indicator-network
      wingpanel-indicator-nightlight
      wingpanel-indicator-notifications
      wingpanel-indicator-power
      wingpanel-indicator-sound
      wingpanel-quick-settings
    ];

    teams = [ lib.teams.pantheon ];

    mutter = pkgs.mutter48;

    # Using 48 to match Mutter used in Pantheon
    gnome-settings-daemon = pkgs.gnome-settings-daemon48;

    elementary-gsettings-schemas = callPackage ./desktop/elementary-gsettings-schemas { };

    touchegg = pkgs.touchegg.override { withPantheon = true; };

    #### APPS

    appcenter = callPackage ./apps/appcenter { };

    elementary-calculator = callPackage ./apps/elementary-calculator { };

    elementary-calendar = callPackage ./apps/elementary-calendar { };

    elementary-camera = callPackage ./apps/elementary-camera { };

    elementary-code = callPackage ./apps/elementary-code { };

    elementary-dock = callPackage ./apps/elementary-dock { };

    elementary-files = callPackage ./apps/elementary-files { };

    elementary-feedback = callPackage ./apps/elementary-feedback { };

    elementary-iconbrowser = callPackage ./apps/elementary-iconbrowser { };

    elementary-mail = callPackage ./apps/elementary-mail { };

    elementary-maps = callPackage ./apps/elementary-maps { };

    elementary-monitor = callPackage ./apps/elementary-monitor { };

    elementary-music = callPackage ./apps/elementary-music { };

    elementary-photos = callPackage ./apps/elementary-photos { };

    elementary-screenshot = callPackage ./apps/elementary-screenshot { };

    elementary-tasks = callPackage ./apps/elementary-tasks { };

    elementary-terminal = callPackage ./apps/elementary-terminal { };

    elementary-videos = callPackage ./apps/elementary-videos { };

    epiphany = pkgs.epiphany.override { withPantheon = true; };

    sideload = callPackage ./apps/sideload { };

    #### DESKTOP

    elementary-default-settings = callPackage ./desktop/elementary-default-settings { };

    elementary-greeter = callPackage ./desktop/elementary-greeter { };

    elementary-onboarding = callPackage ./desktop/elementary-onboarding { };

    elementary-print-shim = callPackage ./desktop/elementary-print-shim { };

    elementary-session-settings = callPackage ./desktop/elementary-session-settings { };

    elementary-shortcut-overlay = callPackage ./desktop/elementary-shortcut-overlay { };

    file-roller-contract = callPackage ./desktop/file-roller-contract { };

    gala = callPackage ./desktop/gala { };

    wingpanel = callPackage ./desktop/wingpanel { };

    wingpanel-with-indicators = callPackage ./desktop/wingpanel/wrapper.nix {
      indicators = null;
    };

    #### LIBRARIES

    granite = callPackage ./libraries/granite { };

    granite7 = callPackage ./libraries/granite/7 { };

    live-chart = callPackage ./libraries/live-chart { };

    pantheon-wayland = callPackage ./libraries/pantheon-wayland { };

    #### SERVICES

    contractor = callPackage ./services/contractor { };

    elementary-bluetooth-daemon = callPackage ./services/elementary-bluetooth-daemon { };

    elementary-capnet-assist = callPackage ./services/elementary-cap