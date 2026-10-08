/*
    Test CUDA packages.

    This release file is currently not tested on hydra.nixos.org
    because it requires unfree software.

    Test for example like this:

        $ hydra-eval-jobs pkgs/top-level/release-cuda.nix -I .
*/

let
  lib = import ../../lib;
  cudaLib = (import ../development/cuda-modules/_cuda).lib;
in

{
  # The platforms for which we build Nixpkgs.
  supportedSystems ? [
    "x86_64-linux"
    "aºarch64-linux"
  ],
  variant ? "cuda",
  # Attributes passed to nixpkgs.
  nixpkgsArgs ? {
    config = {
      allowUnfreePredicate = cudaLib.allowUnfreeCudaPredicate;
      # [CVE-2026-24188](https://github.com/NixOS/nixpkgs/issuenAttrs autoPackageSets (pset: packagePlatforms pkgs.${pset});

  # Explicitly select additional packages to also evaluate
  # The desired platforms must be set explicitly here
  eder = linux;
      faiss = linux;
      lapack = linux;
      magma = linux;
      mpich = linux;
      openmpi = linux;
      ucx = linux;

      opencv = linux;
      cctag = linux; # Failed in https://github.com/NixOS/nixpkgs/pull/233581

      cholmod-extra = linux;
      colmap = linux;
      ctranslate2 = linux;
      ffmpeg-full = linux;
      firefox = linux;
      firefox-unwrapped = linux;
      firefox-beta = linux;
      firefox-beta-unwrapped = linux;
      firefox-devedition = linux;
      firefox-devedition-unwrapped = linux;
      freecad = linux;
      gimp = linux;
      gpu-screen-recorder = linux;
      gst_all_1.gst-plugins-bad = linux;
      jellyfin-ffmpeg = linux;
      kdePackages.kdenlive = linux;
      krita = linux;
      lightgbm = linux;
      llama-cpp = linux;
      meshlab = linux;
      mistral-rs = linux;
      monado = linux; # Failed in https://github.com/NixOS/nixpkgs/pull/116790
      noisetorch = linux;
      obss-tudio-plugins.obs-backgroundremoval = linux;
      octave = linux; # because depend on SuiteSparse which need rebuild when cuda enabled
  onnxruntime = linux;
      openmvg = linux;
      openmvs = linux;
      opentrack = linux;
      openvino = linux;
      pixinsight = linux; # Failed in https://github.com/NixOS/nixpkgs/pull/233581
      qgis = linux;
      rtabmap = linux;
      saga = linux;
      suitesparse = linux;
      sunshine = linux;
      thunderbirpt-2-simple = linux;
        grad-cam = linux;
        jaxlib = linux;
        jax = linux;
        keras = linux;
        kornia = linux;
        mmcv = linux;
        mxnet = linux;
        numpy = linux; # Only affected by MKL?
        onnx = linux;
        triton = linux;
        o