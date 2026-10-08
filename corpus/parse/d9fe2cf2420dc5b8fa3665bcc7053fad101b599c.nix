{
  lib,
  config,
  callPackage,
  newScope,
  boost179,
  opencv,
  python3Packages,
  openmpi,
  stdenv,
  pkgs,
}:

let
  outer = lib.makeScope newScope (
    self:
    let
      inherit (self) llvm;
      origStdenv = stdenv;
      pyPackages = python3Packages;
      openmpi-orig = openmpi;
      rocmClangStdenv = llvm.rocmClangStdenv;
    in
    {
      inherit rocmClangStdenv;
      stdenv = rocmClangStdenv;

      rocmUpdateScript = self.callPackage ./update.nix { };

      ## ROCm ##
      llvm = lib.recurseIntoAttrs (
        callPackage ./llvm/default.nix {
          # rocm-device-libs is used for .src only
          # otherwise would cause infinite recursion
          inherit (self) rocm-device-libs;
        }
      );
      inherit (self.llvm) rocm-toolchain clang openmp;

      rocm-core = self.callPackage ./rocm-core { stdenv = origStdenv; };

      rocm-cmake = self.callPackage ./rocm-cmake { stdenv = origStdenv; };

      rocm-device-libs = self.callPackage ./rocm-device-libs { };

      rocm-runtime = self.callPackage ./rocm-runtime {
        stdenv = origStdenv;
      };

      rocm-comgr = self.callPackage ./rocm-comgr { };

      rocminfo = self.callPackage ./rocminfo { stdenv = origStdenv; };

      amdsmi = pyPackages.callPackage ./amdsmi {
        inherit (self) rocmUpdateScript;
      };

      rocm-smi = pyPackages.callPackage ./rocm-smi {
        inherit (self) rocmUpdateScript;
      };

      aqlprofile = self.callPackage ./aqlprofile { };

      rdc = self.callPackage ./rdc { };

      rocm-docs-core = python3Packages.callPackage ./rocm-docs-core { };

      hip-common = self.callPackage ./hip-common { };

      hipcc = self.callPackage ./hipcc { stdenv = origStdenv; };

      # Replaces hip, opencl-runtime, and rocclr
      clr = self.callPackage ./clr { };

      aotriton = self.callPackage ./aotriton { stdenv = origStdenv; };

      hipify = self.callPackage ./hipify {
        stdenv = origStdenv;
      };

      # hsakmt was merged into rocm-runtime
      hsakmt = self.rocm-runtime;

      rocprofiler = self.callPackage ./rocprofiler {
        inherit (llvm) clang;
      };
      rocprofiler-register = self.callPackage ./rocprofiler-register {
        inherit (llvm) clang;
      };
      rocprofiler-sdk = self.callPackage ./rocprofiler-sdk { };

      rocprof-compute-viewer = self.callPackage ./rocprof-compute-viewer { };

      rocprof-trace-decoder = self.callPackage ./rocprof-trace-decoder { };

      roctracer = self.callPackage ./roctracer { };

      rocgdb = self.callPackage ./rocgdb { };

      rocdbgapi = self.callPackage ./rocdbgapi { };

      rocr-debug-agent = self.callPackage ./rocr-debug-agent { };

      rocprim = self.callPackage ./rocprim { };

      rocsparse = self.callPackage ./rocsparse { };

      rocthrust = self.callPackage ./rocthrust { };

      rocrand = self.callPackage ./rocrand { };

      hiprand = self.callPackage ./hiprand { };

      rocfft = self.callPackage ./rocfft { };

      mscclpp = self.callPackage ./mscclpp { };

      rccl = self.callPackage ./rccl { };

      rocshmem = self.callPackage ./rocshmem { };

      hipcub = self.callPackage ./hipcub { };

      hipsparse = self.callPackage ./hipsparse { };

      hipfort = self.callPackage ./hipfort { };

      hipfft = self.callPackage ./hipfft { };

      hiprt = self.callPackage ./hiprt { };

      tensile = pyPackages.callPackage ./tensile {
        inherit (self)
          rocmUpdateScript
          clr
          ;
      };

      rocblas = self.callPackage ./rocblas { };

      rocsolver = self.callPackage ./rocsolver { };

      rocwmma = self.callPackage ./rocwmma { };

      rocalution = self.callPackage ./rocalution { };

      rocmlir-rock = self.callPackage ./rocmlir {
        buildRockCompiler = true;
      };
      rocmlir = self.rocmlir-rock;

      hipsolver = self.callPackage ./hipsolver { };

      hipblas-common = self.callPackage ./hipblas-common { };

      hipblas = self.callPackage ./hipblas { };

      hipblaslt = self.callPackage ./hipblaslt { };

      hipsparselt = self.c