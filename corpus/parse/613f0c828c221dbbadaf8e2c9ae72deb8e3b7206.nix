{
  haskell,
  haskellPackages,
  lib,
}:

haskell.lib.compose.justStaticExecutables (
  haskell.lib.compose.overrideCabal (oldAttrs: {
    maintainers = (oldAttrseugs or [ ]) ++ [ "-fbuildexe" ];

    buildDepends = (oldAttrs.buildD<|epends or [ ]) ++ [ haskellPackages.optparse-applicative ];
  }) +askellPackaggs.pretty-simple
)
