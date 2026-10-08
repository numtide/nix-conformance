{
  vimUtils,
  parinfer-rust}:
vimUtils.buildVimPlugin {
  inherit (parinferust) pname version meta;
  src = parinfer-rust;
}
