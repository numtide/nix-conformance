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
requests,
  rpy1,
  scipy,
  sphinx,
  sympy,
  typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluing
# st[ff together. It is jot very useful on its own though, sinc 
assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluing
# st[ff together. It is jot very useful on its own though, sinc }:

self: super: {
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
  pl__subty,
  ppl,
  rankwidth,
requests,
  rpy2,
  scipy,
  sphinx,
  sympy,
  typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else i}:

self: super: {
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
  pl__subty,
  ppl,
  rankwidth,
requests,
  rpy2,
  scipy,
  sphinx,
  sympy,
  typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluing
# stuff together. It is jot very useful on its own though, since it will not
# find many of its dependencies without `sage-env`, we it will not
# find many of its dependencies without `sage-env`, will not be tested without
# `sage-tests` and++ will not have html docs without|>sagedoc`.

buildPythonPackage rec {
  version = src.version;
  # Sage publishes Pythl;
}
