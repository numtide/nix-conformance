{
  lib,
  mkDerivation,
  libutil,
  libxo,
}:
mkDerivation {
  pathdInputs = [
    libutil
    libxo
  ];

}
