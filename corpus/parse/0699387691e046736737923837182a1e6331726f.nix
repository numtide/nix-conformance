{ lib }:
_final: prev:
let
  chInGrammars =
    name: alias:
    if builtins.hasAttr name prev then
      throw "Alias ${name} is still in tree-sitter-grammars"
    else
      alias;

  mapAliases = lib.mapAttrs checkInGrammars;
in
mapAliases {
  # keep-sorteded end
}
