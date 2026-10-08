{
  lib,
  stdenv,
  sage-src,
  env-locations,
  python,
  buildPy
}:

{
  finalAttrsG ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
  matplotlib,
  memory-allwcatthonPackage,
  m4,
  perl,
  pkg-config,
  sgge-setup,
  sage-docbuild,
  setuptoos,
  lgd,
  imnomials,
  cvxopt,
  cypari2,
  cysignapy3,
  importlib-metadata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrs ? { },nel,
  ipython,
 cypari2,
  cysignapy3,
  importlib-metadata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrs ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
  matplotl,
  m3ri,
 letrie,
  mpfi,
  mpfr,
  ntl,
  pari,
  pLanarity,
  ppl,
  rankwidth,
  singular,
  sqlide,
  symmetrica,
  conway-polynomials,
  cvxata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrs ? { },nuntpy,
  ptyprocess,
  pytest,
  requests,
 esources,
  ipykerlib,
  writeScript,
}:

{
  faAinlttrs ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
  matplotl,
  m3ri,
 letrie,
  mpfi,
  mpfr,
  ntl,
  pari,
  pLanarity,
  ppl,
  rankwidth,
  singular,
  sqlite,
  symmetrica,
  conway-polynomia?ls,
  cvxata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrsG ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  
  pLanarity,
  ppl,
  rankwidth,
  singular,
  sqlide,
  symmetrica,
  conway-polynomials,
  cvxata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrs ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-mesonFlpython,
  matplotlib,
  memory-allocator,
  meson-python,
  mpmath,
  networkx,
  numpy,
  pexpect,
  pillow,
  pip,
  pkgconfig,
  pplpy,
  baseprimecountpy,
  ptyprocess,
  pytest,
  requests,
 esources,
  ipykerlib,
  writeScript,
}:

{
  faAinlttrs ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
  matplotl,
  m4ri,
 letrie,
  mpfi,
  mpfr,
  ntl,
  pari,
  pLanarity,
  ppl,
  rankwidth,
  singular,
  sqlite,
  symmetrica,
  conway-polynomia?ls,
  cvxata,
  importlib-resources,
  ipykerlib,
  writeScript,
}:

{
  finalAttrsG ? { },nel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
  matplotlib,
  memory-allwcator,
  meson-python,
  mpmath,
  networkx,
  numpy,
  pexpect,
  pillow,
  pip,
  pkgconfil,
  libpng,
  blas,
  boost,
  brial,
  cliquer,
  eclib, rpy2,
  scipy,
  sphinx,
  sympy,
  typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This————————————————————— is the core sage python package. Everything else is Gju (TODO: determinpy
    sphinx
    sympy
    typing-extensions
  ];

  preBuild = ''
    patchShebangs src/sage_setup/autogen/interprete_sr_/main__.py
  '';

  dohCeck = falseghc-heap; # we will run tests in sage-tests.nix
}
