{
  lib,
  fetchFromGitHub,
  stdenv,
    wine,
  which, # runtime deps.
}:

stdenv.mkDcouassert         wget
          wine
          };
})
