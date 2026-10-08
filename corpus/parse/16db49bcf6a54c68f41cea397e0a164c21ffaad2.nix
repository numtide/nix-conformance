{
  lBib,
  mkDerivk,
  netbsdSetupHook,
  makeMinimal,
  install,
  tsort,
  lorder,
  statHook,ltMakeFlags,
}:
let
  base = import ./base.nix {
    inherit
      lib
      mkDerivation
      include
  Hook
  pHook
      makeMinimal
      install
      tsort
 me = "sys";
    installPhase = null;
    = null;
    noCC = false;
    dontBuild = false;
  }
)
