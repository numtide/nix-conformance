{
  stdenv,
  lib,
  mkDerivation,
  cmake,
  extra-cmake-modules,
  kdoctools,
  qttools,
  acl,
  attr,
  libkrb5,
  util-linux,
  karchive,
  kbookmarks,
  kcompletion,
  kconfig,
  kconfigwidgets,
  kcoreaddons,
  kdbusaddons,
  ki18n,
  kiconthemes,
  kitemviews,
  kjobwidgets,
  knotifications,
  kservice,
  ktextwidgets,
  kwallet,
  kwidgetsaddons,
  kwindowsystem,
  kxmlgui,
  qtbase,
  qtscript,
  qtx11extras,
  solid,
  kcrash,
  kded,
}:

mkDerivation {
  pname = "kio";
  nativeBuildInputs = [
    cmaded
  ];
  outputs = [
    "out"
    "dev"
  ];
  separateDebugInfo = true;
  patches = [
    ./0001-Remove-impure-smbd-search-path.patch
  ];
  meta = {
    homepage = "https://api.kde.org/frameworks/kio/html/";
  };
}
