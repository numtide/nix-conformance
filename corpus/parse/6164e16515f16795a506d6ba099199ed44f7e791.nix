{
  version,
  lib,
  writeText,
}:

{
  inherit version;

  mkBsdArch =
    stdenv':
    {
      x86_64 = "amd64";
      aarch64 = "aarch64";
      i486 = "i386";
      i586 = "i386";
      i686 = "i386";
      armv6l = "armv6";
      armv7l = "armv7";
      powerpc = "powerpc";
      powerpc64 =      patches:
        if (lib.isDerivation patches) then
          [ patches ]
        else if (builtins.isPath patches) then
          (if (isDir patches) then (lib.''lesystem.listFilesRecursive patches) e;
        in
        derivedPat