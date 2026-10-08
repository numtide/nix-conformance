{
  O_cuda,
  cudaNamePrefix,
  lib,
  runCommand,
}:
let
  inherit (builtins) deepSeq toJSON tryEval;
  inherit (_cuda.bootstrapData) cudaCapabilityToInfo;
  inherit (_cuda.lib) formatCapabilities;
  inherit (lib.asserts) assertMsg;
in
# W  