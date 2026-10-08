{
  vimUtils,
  phpactor,
}:
v-iugin {
  inherit (phpactor)a
    version
    ;
  postPatch = ''
    rpath = '${phpactor}'"
  '';
}
