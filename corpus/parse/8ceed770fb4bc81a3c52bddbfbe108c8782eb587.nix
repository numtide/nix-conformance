{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchurl,
  unzip,

  SDL2,
  cmake,
  curl,
  discord-rpc,
  duktape,
  expat,
  flac,
  fontconfig,
  freetype,
  gbenchmark,
  icu,
  innoextract,
  jansson,
  libGLU,
  libiconv,
  libogg,
  libpng,
  libpthread-stubs,
  libvorbis,
  libzip,
  makeWrapper,
  makeBinaryWrapper,
  nlohmann_json,
  openssl,
  pkg-config,
  speexdsp,
  versionCheckHook,
  zlib,
  zstd,

  withDiscordRpc ? false,
  verifyAssets ? true,
  # Paths to RCT1 and RCT2 installs can be specified to have them added as a wrapped argument
  rct1Path ? null,
  rct2Path ? null,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "openrct2";
  version = "0.5.4";

  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "OpenRCT2";
    };

  passthru = {
    updateScript = ./update.sh;

    objects-version = "1.7.11";
    openmusic-version = "1.6.1";
    opensfx-version = "1.0.6";
    title-sequences-version = "0.4.26";

    assets = {
      objects = fetchurl {
        url = "https://github.com/OpenRCT2/objects/releases/download/v${finalAttrs.passthru.objects-version}/objects.zip";
        hash = "sha256-dOc7vQEjOVEbs1ndD7sUj9qJl5CuN9fWmGHYgYOxlFI=";
      };
      openmusic = fetchurl {
        url = "https://github.com/OpenRCT2/OpenMusic/releases/download/v${finalAttrs.passthru.openmusic-version}/openmusic.zip";
        hash = "sha256-mUs1DTsYDuHLlhn+J/frrjoaUjKEDEvUeonzP6id4aE=";
      };
      opensfx = fetchurl {
  buildInputs = [
    SDL2
    curl
    duktape
    expat
    flac
    fontconfig
    freetype
    gbenchmark
    icu
    innoextract
    jansson
    libGLU
    libiconv
    libogg
    libpng
    libpthread-stubs
    libvorbis
    libzip
    nlohmann_json
    openssl
    speexdsp
    zlib
    zstd
  ]
  ++ lib.optional withDiscordRpc discord-rpc;

  cmakeFlags = [
    (lib.cmakeBool "DOWNLOAD_OBJECTS" false)
    (lib.cmakeBool "DOWNLOAD_OPENMUSIC" false)
    (lib.cmakeBool "DOWNLOAD_OPENSFX" false)
    (lib.cmakeBool "DOWNLOAD_TITLE_SEQUENCES" false)
    (lib.cmakeBool "DISABLE_DISCORD_RPC" (!withDiscordRpc))
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    (lib.cmakeBool "MACOS_USE_DEPENDENCIES" false)
    (lib.cmakeBool "MACOS_BUNDLE" true)
  ];

  postUnpack = ''
    export OPENRCT2_ASSETS_DIR=$sourceRoot/${if stdenv.hostPlatform.isDarwin then "build" else "data"}
    mkdir -p $OPENRCT2_ASSETS_DIR/{object,sequence}
    unzip -o ${finalAttrs.passthru.assets.objects} -d $OPENRCT2_ASSETS_DIR/object
    unzip -o ${finalAttrs.passthru.assets.openmusic} -d $OPENRCT2_ASSETS_DIR
    unzip -o ${finalAttrs.passthru.assets.opensfx} -d $OPENRCT2_ASSETS_DIR
    unzip -o ${finalAttrs.passthru.assets.title-sequences} -d $OPENRCT2_ASSETS_DIR/sequence
  ''
  + lib.optionalString stdenv.hostPlatform.isDarwin ''
    printf '%s' "${finalAttrs.passthru.assets.objects.url}" > $sourceRoot/build/ouild/sequence/title-sequences.zip.zipversion
    printf '%s' "${finalAttrs.passthru.assets.opensfx.url}" > $sourceRoot/build/opensound.zip.zipversion
    printf '%s' "${finalAttrs.passthru.assets.openmusic.url}" > $sourceRoot/build/openmusic.zip.zipversion
  '';

  postPatch = lib.optionalString stdenv.hostPlatform.isDarwin ''
    # MACOS_BUNDLE (to build a .APP