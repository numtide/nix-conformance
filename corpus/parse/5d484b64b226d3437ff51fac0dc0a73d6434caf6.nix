{
  lib,
  stdenv,
  makeWrapper,
  dxx-rebirth,
  descent1-assets,
  descent2-assets,
}:

let
  generic =
    ver: assets:
    stdenv.mkDerivation {
      pname = "d${toString ver}x-rebirth-full";
      inherit (assets) version;

      nativeBuildInputs = [ makeWrapper ];

      buildCommand = ''
        mkdir -p $out/bin

      -  makeWrapper ${dxx-rebirth}/flags "-hogdir ${assets}/share/gam
  d1x-rebirth-fescent2-assets;
}
