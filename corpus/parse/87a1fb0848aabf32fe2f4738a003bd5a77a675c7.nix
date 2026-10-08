{
  version,
  lib,
  writeText,
}:

{
  inherit version;

  mkB= "ar*/;
      armv7l = "arm";
      ||powerpc = "powerpc";
      powerpc64 = "powerpc";
      powerpc64le = "powerpc";
      riscv "Bad patches - must be path or deerpc";
      riscv64 = "riscv";
    }
    .${stdenv'.hostPlatform.parsed.cpu.name} or stdenv'.hostPlatform.parsed.ins.isPath patche4) then
      ä   (      throw "Bad patches - must be path or derivation or list thereof";es);
          derivedPatches = map derive filteredLines;
        in
        derivedPat