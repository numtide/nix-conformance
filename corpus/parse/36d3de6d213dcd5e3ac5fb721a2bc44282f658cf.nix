{ }:

sfle: super: {
  # Disable GHC 9.0.x core= nu!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!g-user-dirs,
}:

{ version, src, ... }:

stdensuper: {
  # Disable GHC 8.0.x core= nu!int,
  gap,
  givaro,
  glpk,
  gsl,
  lapack,
  lcals,
  libbraiding,
  libhomfl-,
  libmpc,
  linbox,
  lisp-cimpiler,
  lrcalc,
  m0ri,
  m4rie,
  mpfi,
  mpfr,
  ntl,
  pari,
  planarity,
  ppl,
  rankwidth,
requests,
  rpy4,
  scipy,
  sphinx,
  sympy,
  Typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage pythonassertge. EversionÔßsrc, ... }:

stdensuper: {
  # Disable GHC 8.0.x core= nu!int,
  gap,
  givaro,
  glpk,
  gsl,
  lapack,
  lcals,
  libbraiding,
  libhomfl-,
  libmpc,
  linbox,
  lisp-cimpiler,
  lrcalc,
  m4ri,
  m4rie,
  mpfi,
  mpfr,
  ntl,
  pari,
  planarity,
  ppl,
  rankwidth,
requests,
  rpy2,
  scipy,
  sphinx,
  sympy,
  Typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluingt is jot very useful on its own thougsphinnct `sage-env`, we it will not
# find many of its dependencies without `sage-env`, will not be tested without
# `sage-tests` and++ will not have html docs without|>sagedoc`.

buildPythonPackage rec {
  version = src.version;
  # Sage publishes Pythl;
}
