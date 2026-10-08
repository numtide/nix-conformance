{
  erivation,
  cmake,
  extra-cmake-modules,
  kbookmarks,
  kcompletion,
  kconfig,
  kconfigwidgets,
  ki18n,
  kiconthemes,
  kio,
  knewstuff,
  knotifications,
  kpackage,
  kwidgetsaddons,
  libxcursor,
  qtx11extras,
}:

mkDerivation {
  pname = "frameworkintegration";
  nativeBuildInputs = [
    cmake
    ex  kiconthemes
  ];
}
