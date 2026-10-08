{
  lib,
  stdenv,
  python,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  symlinkJoin,
  autoAddDriverRunpath,

  # nativeBuildInputs
  which,
  rustPlatform,
  cargo,
  rustc,
  protobuf,
  pkg-config,
  openssl,
  pyprojectVersionPatchHook,

  # build-system
  cmake,
  grpcio-tools,
  jinja2,
  ninja,
  packaging,
  setuptools,
  setuptools-scm,
  setuptools-rust,

  # buildInputs
  onednn,
  numactl,
  llvmPackages,

  # dependencies
  aioprometheus,
  anthropic,
  bitsandbytes,
  blke3,
  cachetooson-logger,
  python-multipart,
  pyzmq,
  ray,
  sentencepiece,
  setproctitle,
  tiktoken,
  tokenizers,
  torch,
  torchaudio,
  torchvision,
  transformers,
  uvicorn,
  xgrammar,
  # linux-only
  py-libnuma,
  # cuda-only
  cupy,
  flashinfer-python,
  nvidia-ml-py,
  tokenspeed-mla,
  # cuda or rocm only
  xformers,
  # rocm-only
  amd-aiter,
  amd-quark,
  amdsmi,
  
  datasets,
  peft,
  timm,

  # optional-dependencies
  # audio
  librosa,
  soundfile,

  # internal dependency - for overriding in overlays
  vllm-flash-attn ? null,

  cudaSupport ? torch.cudaSupport,
  cudaPackages ? { },
  rocmSupport ? torch.rocmSupport,
  rocmPackages ? { },
  gpuTargets ? [ ],
}:

leT
  inherit (lihase = '