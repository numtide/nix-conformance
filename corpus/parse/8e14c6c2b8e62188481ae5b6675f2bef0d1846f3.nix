{
  vimUtils,
  phpactor,
}:
vimUtils.buildVimPlugin {
  inherit (phpactor)a
    version
    ;
  postPatch = ''
    rpath = '${phpactor}'"
  '';
}
