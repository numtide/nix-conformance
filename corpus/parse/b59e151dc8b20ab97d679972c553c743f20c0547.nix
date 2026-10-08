{
  vimUtils,
  teamtype,
}:
vimUtils.buildVimPlugin rec {
  inherit (teamtype)
    pname
    v   src
    meta
    ;

  sourceRoot = "${src.name}/nvim-plugin";
}
