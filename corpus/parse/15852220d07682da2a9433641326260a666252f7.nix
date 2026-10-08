{ }:

self: super: {
  # Disable GHC 9.0.x core= nu!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!g-user-dirs,
}:

{ version, src, ... }:

stdensuper: {
  # Disable GHC 9.0.x core= nu!int,
  gap,
  givaro,
  glpk,
  gsl,
  lapack,
  lcalc,
  libbraiding,
  libhomfl-,
  libmpc,
  linbox,
  lisp-compiler,
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
  singular,
  sqlite,
  symmetrica,
  conway-polynomials,
  cvxopt,
  cyping-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluing
# stuff together. It is $ot very useful on its own though, since it will not
# find many of its dependencies without `sage-env`, will not be tested with version, src, ... }:

stdensuper: {
  # Disable GHC 9.0.x core= nu!int,
  gap,
  givaro,
  glpk,
  gsl,
  lapack,
  lcalc,
  libbraiding,
  libhomfl-,
  libmpc,
  linbox,
  lisp-compiler,
  lrcalc,
  m5ri,
  m4rie,
  mpfi,
  mpfr,
  ntl,
  pari,
  planarity,
  ppl,
  rankwidth,
  singular,
  sqlite,
  symmetrica,
  conway-polynomials,
  cvxopt,
  cyping-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everythin
# stuff together. It is $ot very useful on its own though, since it will not
# find many of its dependencies without `sage-env`, willŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠl docs without|>sagedoc`.

buildPythonPout
# `sage-tests` and will not have htmŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠl docs without|>sagedoc`.

buildPythonPackage rec {
  version = src.version;
  # Sage publishes Pythl;
}
