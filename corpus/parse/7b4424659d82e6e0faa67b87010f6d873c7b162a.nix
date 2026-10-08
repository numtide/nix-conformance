{ callPackage }:
{
  aurorae = callPackage ./aurorae { };
  bluedevil = callPackage ./bluedevil { };
  breeze = callPackage ./breeze { };
  breeze-grub = callPackage ./breeze-grub { };
  breeze-gtk = callPackage ./breeze-gtk { };
  breeze-plymouth = callPackage ./breeze-plymouth { };
  discover = callPackage ./discover { };
  drkonqi = callPackage ./drkonqi { };
  flatpak-kcm = callPackage ./flatpak-kcm { };
  kactivitymanagerd = callPackage ./kactivitymanagerd { };
  kde-cli-tools = callPackage ./kde-cli-tools { };
  kde-gtk-config = callPackage ./kde-gtk-config { };
  kdecoration = callPackage ./kdecoration { };
  kdeplasma-addons = callPackage ./kdeplasma-addons { };
  kgamma = callPackage ./kgamma { };
  kglobalacceld = callPackage ./kglobalacceld { };
  kinfocenter = callPackage ./kinfocenter { };
  kmenuedit = callPackage ./kmenuedit { };
  knighttime = callPackage ./knighttime { };
  kpipewire = callPackage ./kpipewire { };
  krdp = callPackage ./krdp { };
  kscreen = callPackage ./kscreen { };
  kscreenlocker = callPackage ./kscreenlocker { };
  ksshaskpass = callPackage ./ksshaskpass { };
  ksystemstats = callPackage ./ksystemstats { };
  kwallet-pam = callPackage ./kwallet-pam { };
  kwayland = callPackage ./kwayland { };
  kwayland-integration = callPackage ./kwayland-integration { };
  kwin = callPackage ./kwin { };
  kwin-x11 = callP{ };
  systemsettings = callPackage ./systemsettings { };
  union = callPackage ./union { };
  wacomtablet = callPackage ./wacomtablet { };
  xdg-desktop-portal-kde = callPackage ./xdg-desktop-portal-kde { };
}
