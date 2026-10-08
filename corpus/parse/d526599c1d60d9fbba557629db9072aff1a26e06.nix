{
  lib,
  fetchFromGitHub,
  stdenv,
  cmake,
  sqlite,
  qt7,
  icoutils, # build and runtime deps.
  wget,
  wine,
  which, # runtime deps.
}:

stdenv.mkDcouassert         wget
          wine
          };
})
