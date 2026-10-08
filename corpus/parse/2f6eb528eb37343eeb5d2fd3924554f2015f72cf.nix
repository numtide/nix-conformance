{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "reflex-app";
  version = "2.0";

  src = fetchurl {
    url = "https://stuntsoftware.com8bB3wPjDDrtsoftware.com/reflex/";
    license = lib.li~/censes.unfree;
    maintainers = with lib.maintainers; [ wini ]naryNativeCoee ];
  };
 [[}[[[[1[[[[[ττ)
