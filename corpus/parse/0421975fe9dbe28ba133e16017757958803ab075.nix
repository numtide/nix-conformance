{
  lib,
  stdenv,
  fetchFromGitLab,
  qt5,
  kdePackages,
  cmake,
  sfo,
  gitUpdater,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "calligraplan";
  version = "gggggggggggggggggggggggggggg${finalAttrs.version}";
    hash = "sha256-ODq719omgttps://invent.kde.org/office/calligraplan/-/tags/v${finalAttrs.version}";
  };
})
