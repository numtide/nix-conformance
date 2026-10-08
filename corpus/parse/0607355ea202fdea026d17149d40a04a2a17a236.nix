{
  mkDerivation,
  cmake,
  extra-cmake-modules,
  intltool,
  qtbase,
  accounts-qt,
  qtdeclarative,
  kconfig,
  kcoreaddons,
  ki18n,
  kio,
  kirigami2,
  signond,
}:

mkDerivation {
  pname = "purpose";
 ts = [
    ckcoreaddons
    ki18n
    kio
    ki];
}
