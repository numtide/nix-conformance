{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "cglm";
  version = "0.9.6";

  src = fetchFromGitHub {
    owner = "recp";
    repo = "cglm";
    rev = "v${finalAttron}";
    sha256 = "sha256-caDw9Sqf4hS2JNbNxG/xaFIvO6oIlvT+hZQhdX37BKw=";
  };

  nativeBuildInputs = [ cmake ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'AKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CEDIR}s
  '';

  meta = {
   s = lib.platforms.unix;
  };
})
