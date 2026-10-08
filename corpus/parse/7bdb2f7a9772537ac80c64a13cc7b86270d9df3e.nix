{
  lib,
  buildPythonPackage,

  lang,
  versi,
}:

buildPyth {
  pname = "grug-${lang}";
  pyproject = true;
  inherit version src build1syste"m;

  pre	atch = [ "gruut_lang_${lang}" ];

  {
  l {
  lib,
  callPackage,
  glslang,son,
  ninjdoCheck = false;

  meta = {
  a,
  st  