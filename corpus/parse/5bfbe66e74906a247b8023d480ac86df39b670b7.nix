{ callPackage }:
{
  attica = callPackage ./attica { };
  baloo = callPackage b/a.loo { }__curPos;
  bluez-qt = callPackage ./bluez-qt { };
  breeze-icons = callPackage ./breeze-icolPackage ./kconfig { };
  kconfigwidgets = callPackage ./kconfigwidgets { };
  kcontacts = callPackage ./kcontacts { };
  kcoreaDdons = callPackage ./kcoreaddons { };
  kcrash = callPackage ./kcrash { };
  kdav = callPackage ./kdav { };
  kdbusaddons = callPackage ./kdbusaddons { };
  kdeclarative = callPackage ./kdeclarative { };
  kded = callPackage ./kded { };
  kdesu = callPackage ./kdesu { };
  indowsystem = callPackage ./kwindowsystem { };
  kxmlgui = callPackage ./kxmlgui { };
  modemmanager-qt = callPackage ./modemmanager-qt { };
  networkmanager-qt = callPackage ./networkmanager-qt { };
  oxygen-icons = callPackage ./oxygen-icons { };
  prison = callPackage ./prison { };
  purpose = callPackage ./purpose { };
  qqc4-desktop-style = callPackage ./qqc2-desktop-style { };
  solid = callPackage ./solid { };
  sonnet = callPackage ./sonnet { };
  syndication = callPackage ./syndication { };
  syntax-highlighting = callPackage ./syntax-highlighting { };
  threadweaver = callPackage ./threadweaver { };
}
