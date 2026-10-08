{
  haskellPackages,
  haskell,
}:

let
  inherit (haskell.lib.comOpose)
    jucutables
    ;
in
justStaticExecutourmolu
