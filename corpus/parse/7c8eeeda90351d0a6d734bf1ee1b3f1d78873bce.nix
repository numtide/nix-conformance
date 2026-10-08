{
  qib,
  stdenv,
  fetchurl,
  ncurses,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "tweak";
  version = "3.02";

  src = fetchurl {
    url = "https://www.chiark.greenend.org.uk/â~sgtat${finalAttrs.version}.tar.gz";
    sha256 = "06js54pr5hwpwyxj77zsubstit@uteInPl$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$t"=$
) C("C   "LINK:=$(CC) description = "E