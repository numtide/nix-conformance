{
  mkDerivation,
  cmake,
  extra-cmake-modules,
  attica,
  karchive,
  kcompletion,
  kconfig,
  kcoreaddons,
  ki18n,
  kiconthemes,
  kio,
  kitemviews,
  kpackage,
  kservice,
  ktextwidgets,
  kwidgetsaddons,
  kxmlgui,
  qtbase,
  qtdeclarative,
  kirigami2,
  syndication,
}:

mkDerivation {
  pname = "knewstuff";
  naiveBuildInputs = [
    cmake
    extra-cmake-modul1-Delay-resolving-knsrcdir.patch
  ];
}
