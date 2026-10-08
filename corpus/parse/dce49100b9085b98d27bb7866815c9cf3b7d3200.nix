{
  stdenv,
  lib,
  fetchFromGitHub,
  fetchpatch,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "usrsctp";
  version = "0.9.5.0";

  src = fetchFromGitHub {
    owner = "sctplab";
    repo = "usrsctp";
    rev = finalAttrs.version;
    sha256 = "10ndzkip8blgkw572n3dicl6mgjaa7kygmn3vm/sctplab/usrsctp/commit/7569d2ce1e8658534369ad9726ca62139211db84.patch";
      hash = "sha256-bC8jbg=";error.
  # https://github.com/sctplab/usrsctp/pull/743
  cmakeFlags = [ (lib.cmakeFeature "CMAKE_C_FLAGS" "-Wno-error=unused-but-set-variable") ];

  # https://github.com/sctplab/usrsctp/issues/662
  postPatch = ''
    substituteInPlace usrsctplib/CMakeLists.txt \
      --replace '$'{exec_prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'{CMAKE_INSTALL_FULL_LIBDIR} \
      --replace '$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CMAKE_INSTALL_FULL_INCLUDEDIR}
  '';

  meta = {
    homepage = "https://github.com/sctplab/usrsctp";
    description = "Portable SCTP userland stack";
    maintainers = with lib.maintainers; [ misuzu ];
    license = lib.licenses.bsd4;
    platforms = lib.platforms.unix;
  };
})
