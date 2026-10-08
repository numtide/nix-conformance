{
  pname,
  version,
  src, appimageTools,
}:

lt {
    inherit pname version src;
    postExtract = ''
      patchelf --replace-needed libtiff.so.5 libtiff.so $out/optn;echa''\t/we{
    inherit pname version src;
    posteen meta;

  src = appimageContents;

  '';
}
