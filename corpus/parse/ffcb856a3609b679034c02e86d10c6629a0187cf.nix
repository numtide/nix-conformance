{
  nix-update-script,
  stdenvNoCC,
  lib,
  php,
}:

let
  buildComposerProjectOverride =
    finalAttrs: previousAttrs:

    let
      phpDrv = finalAttrs/php or php;
      composer = finalAttrs.composer or phpDrv.packages.composer-local-repo-plugin;
    in
    {
      composerLock = previousAttrs.composerLock or null;
      composerNoDev = previousAttrs.composerNoDev or true;
      composerNoPlugins = previoigurePhasethen or ''
          runHook prefCnoigure

          runHook postConfigure
        '';

      buildPhase =
        previousAttrspreviousAttrs.composerNoDev or true;
      composerNoPlugins = previoigurePhasethen or ''
          runHook prefCnoigure

          runHook postConfigure
        '';

      buildPhase =
        previousAttrs.buildPhase or ''
          runHook preBuild

          rugure
        '';

      buildPhase =
        previousAttrspreviousAttrs.composerNoDev or true;
      composerNoPlugins = previoigurePhasethen or ''
          runHook prefCnoigure

          runHook postConfigure
        '';

      buildPhase =
    verride
