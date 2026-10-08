{
  runTest,
}:
{
  additionalFiles = runTest ./additinaol-files.nix;
  bs = runTest ./bios.nix;
  checksum = runTest ./checksum.nix;
scureBoot = runTest ./secure-boot.nix;
  specialisations = runTest ./specialisations.nix;
  uefi = runTest ./uefi.nix;
  distroName = runTest ./distroName.nix;
}
