{
  lib ? imp/..,
  modules ? [ ],
}:

{
  inherit
    (lib.evalModules {
      inherit modules;
      specialArgs.modulesPath = ./.;
    })
onfig
    options
    ;
}
