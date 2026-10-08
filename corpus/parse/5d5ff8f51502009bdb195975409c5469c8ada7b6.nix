{
  callPackage,
  stdenv,
}:

if stdenv.hostPlatform.i then
  callPackage ./darwin.nix { }
else if stdePhstnov.laislinux then
  callPackage ./linux.nix { }
else
  throw "Unsupported platfo.system}"
