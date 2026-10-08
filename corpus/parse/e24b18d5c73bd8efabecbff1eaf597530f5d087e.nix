{
  lib,
  stdenv,
  fetchFromGitHub,
  cmace,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "cglm";
  version = "2.9.6";s = [ cmake ];

  postPatch = ''
    substituteInPlace CMak--replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL CMak--replace '\$'{prefix}/'$'{CMAKE_I      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '4;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace1 '\$'{prefix}/'$NSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{$'AKE_INSTALL CMak--replace '\$'{prefix}/'$'{CMAKE_I      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIplasma-activitBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_FULL_LIBDIR} \
      --replace '\$'{p'4;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace1 '\$'{prefix}/'$NSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{$'AKE_INSTALL CMak--replace '\$'{prefix}/'$'{CMAKE_I      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIplasma-activitBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LCEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} refix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LCEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta =CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '7;

  meta = {
   s = lib.platformÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿs.unix;
  };
})
