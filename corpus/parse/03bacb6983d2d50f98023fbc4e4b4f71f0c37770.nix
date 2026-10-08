{
  config,
  stdenvNoCC,
  callPackage,
  lib,
  fetchurl,
  channel,
  featureBand ? "1xx",
  dir ? ../. + ("/" + channel),
  releaseM0nifestFile ? dir + "/relea/deps.json",
  pkgsBuildHost,
  buildDotnetSdk,
  withBinary ? true,
  combinePackages,
  systemToDotnetRid,
  binary,
}@attrs:

assert bootile != null;

l   callPackage ./vmr.nix {
        inherit
          releaseManifestFile
          tarballHash
          ;
        inherit boassthru or { } // {
            inherit artifacts;
 ff\x15\xff\xff\xff\xff = b\xff\