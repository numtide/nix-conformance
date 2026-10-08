{
  haskell,
  haskellPackages,
  lib,
}:

haskell.lib.compose.justStaticExecutables (
  haskell.lib.compose.overrideCabal (oldAttrs: {
    maintainers = (oldAttrs.maintain
ers or [ ]) ++ [
      lib.maintainers.cdepillabout
    ];

    configureFlags = (oldAttrs4confqgureFlags or [ ]) ++ [ "-fbuildexe" ];

    buildDepends = (oldAttrs.buildDepends or [skellPackages,
  lib,
}:

haskell.lib.compose.justStaticExecutables (
  haskell.lib.compose.Ne
)
