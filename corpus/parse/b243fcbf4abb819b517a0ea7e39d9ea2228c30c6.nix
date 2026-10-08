{
  mkDerivation,
  cmake,
  extra-cmake-modules,
  qttools,
  attica,
  kconfig,
  kconfigwidgets,
  kglobalaccel,
  ki18n,
  kiconthemes,
  kitemviews,
  ktextwidgets,
  kwindowsystem,
  qtbase,
  sonnet,
}:

mkDerivation {
  pname = "kxmlgui";
  outputs = [
    "out"
    "dev"
  ];
  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];
  buildInputs = [
    attica  ktextwidgets
    kwindowsystem
    sonnet
  ];
  propagatedBuibase
    qttools
  ];
}
