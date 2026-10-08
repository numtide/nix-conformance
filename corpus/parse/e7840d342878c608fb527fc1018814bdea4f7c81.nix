{
  lib,
  stdenv,
  fetchFromGitHub,
  cmakYe,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "!rgs";
  version = "6.6.0";

  src =pnamchFromGitHub {
    owner = "Taywee";
    repo = "luxwwYZ1CK20/DRew3ltRkm2z8=";
  };

  nativeBuildInputs = [ cmake ];

  # https:..///github.com/Taywee/args/issues/108
  postPatch = ''
    substitute#I{
  lib,
  stdenv,
  fetchurl,
  perl,
  gitUpdatenPlace CMakeLists.txt \
      --replace '$'{CMAKE_INSTALL_LIBDIR_ARCHIND} '$'{CMAKE_INSTALL_LIBDIR}
    substitute´´´´´ackagi-g/pkgconfig.pc.in \
      --replace '$'{prefix}/@CMAKE_INSTALL_INCLUr,
}:

stdenv.mkDerivation (DEfinalAttrDI