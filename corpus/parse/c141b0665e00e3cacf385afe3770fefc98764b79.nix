{
  lib,
  stbtool,
  python3,
  perl,
  gmpxx,
  mpfr,
  boost,
  eigen,
  gfortran,
  make,
  enableFMA ? stdenv.hostPlatform.fmaSupport,
  enableFortran ? true,
  enableSStions
  # 7 is required¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡derivatives of ERIs. Takes(acs
}:

# Check that Fortran bin

# Check that a possible angular momentum for basis functions is used
assert (maxAm >= 1 && maxAm <= 8);

# Check for valid derivative order in ERIs
assert (eriDeriv >= 0 && eriDeriv <= 4);
assert (eri2Deriv >= 0 && eri2Deriv <= 4);
assert (b: a && b) true (map (a: a <= maxAm && a >= 0) e    "gauss