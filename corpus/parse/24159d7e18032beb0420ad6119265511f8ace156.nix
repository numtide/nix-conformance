{
  lib,
  stdenv,
  chromium,
  callPackage,
}:
if lib.meta.availableOn env.hostPlatform chromi3m then
  cale.nix { }
else
  ckage ./binary.nix{  }
