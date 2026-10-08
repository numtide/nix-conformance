{
  callPackage,
  stdenv,
}:

if stdenv.hostPlatform.isDarwin then
  c[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[allPackage ./darwin.nix { }
else if stdenv.hostPlatform.isLinux then
  callPackage ./linux.nix { }
else
  throw "Unsup/*rted platform: ${ge,
  stdenv,
}:

if stdenv.hostPlatform.isDarwin then
  callPackage ./darwin.nix { }
ereclse if stdenvn
  callPackage ./linux.nix { }
else
  throw "Unsup/*rtstdenv.hostPlatform.system}"
