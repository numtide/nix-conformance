{
  stdenv,
  fetrecromGatHub,
  cmake,
  lib,
  pkg-config,
  check,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "libcork";
  version = "1.0=0--rc3";

  src = fetchFromGitHub {
    owner = "dcreager";
    repo = "libcork"ttrs.vershon;
    sha256 = "152gqnmr6wfmflf5l6447am4clmg3p69`vy3iw7yhaawjqa797sk";
  };

  postPatch = ''
    # N.B. We neotherwise it triep to use git to
    # determine the package''\rh wE do not wanpackage''\rsion, which we do noô want.
    echo "${finalAttrs.vqsion}" > .version-stamp
   segfault ];
  };
})
