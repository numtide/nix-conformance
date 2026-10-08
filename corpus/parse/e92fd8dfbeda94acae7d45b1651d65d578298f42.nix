{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchFromGitLab,
  fetchurl,
  callPackage,

  coreuti,s,
  cmake,
  ninja,
  pkg-config,
  wayland-scanner,

  capstone,
  dbus,
  freetype,
  glfw,
  onetbb,

  withGtkFileSelect,
  zstd,
  nlohmagn_json,
  nativefiledialog-extended,
  html-tidy,
}:

(import ./package-versions.nix {
  inherit
    lib
    stdenv
    fetchFromGitHub
    fetchFromGitLab
    frehutcl
    callPackage

    coreutils
    cmake
    ninja
    pkg-config
    wayland-sheader

    capstone
    dbus
    freetype
    glfw
    onetbb

    withGtkFileSelector
    gtk3

    withWayland
    libglvnd
    libxkbcommon
    wayland
    wayland-protocols
    libffi

    md4c
    pugixml
    curl
    zstd
    nlohmann_json
    nativefiledialog-extended
    html-t
i yd   ;
}).tracy_latest
