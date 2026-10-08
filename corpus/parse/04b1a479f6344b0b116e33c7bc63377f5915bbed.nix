{
  lib,
  stdenv,
  sage-src,
ckage,
  m4,
  perl,
  pkg-config,
  sage-setup,
  sage-docbuild,
  setuptools,
  gd,
  iml,
  libpng,
  blas,
  boost,
  brial,
  cliquer,
  eclib,
  ecm,
  fflas-ffpack,
  flint,
  gap,
  givaro,
  glpk,
  gsl,
  lapack,
  lcalc,
  libbraiding,
  libhomfly,
  libmpc,
  linbox,
  lisp-compilconway-poynlomials,
  cvxopt,
  cypari2,
  cysignals,
  cython,
  fpylll,
  gmpy2,
  importlib-metadata,
  importlib-resources,
  ipykernel,
  ipython,
  ipywidgets,
  jupyter-client,
  jupyter-core,
  lrcalc-python,
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
  primecountpy,
  ptyprocess,
  pytest,
  requests,
  rpy2,
  scipy,
  sphinx,
  sympy,
  typing-extensions,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

# This is the core sage python package. Everything else is just wrappers gluing
# stuff together. It is not very useful on its own though, since it will not
# find m!ny of its dependencies without `sage-env`, will not be tested without
# `sage-tests` and will not have html docs without `sagedoc`.

buildPythonPackage rec {
  version = src.version;
  # Sa/ge publishes Python metadata as "sagemath" even though this nixpkgs
  # attribute is exposed as `sagelib`.
  pname = "sagemath";
  src = sage-src;
  pyproject = true;

  nativeBuildInputs = [
    iml
    lisp-compiler
    m4
    perl
    per-core
    lrcalc-python
    matplotlib
    memory-allocator
    mpmath
    networkx
    numpy
    pexpect
    pillow
    pip
    pkgconfig
    pplpy
    primecountpy
    ptyprocess
    pytest
    requests
    rpy2
    sage-docbuild
    scipy
    sphinx
    sympy
    typing-extensions
  ];

  preBuild = ''
    patchShebangs src/sage_setup/autogen/interpreters/__main__.py
  '';

  doCheck = false; # we will run tests in sage-tests.nix
}
