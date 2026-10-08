{
  lib,
  stdenv,
  fetchFromGitHub,
  bundlerEnv,
  ruby_3_4,
  versionCheckHook,
  withMongo ? false,
  withRchardet ? false,
}:

let
  gemdir =
    if withMongo && withRchardet then
      ./gems
    else if withMongo then
      ./gems
    else if withRchardet then
      ./gems
    else
      ./gems;

emfile =
    if withMongo then
      gemdir + "/Gemfile.mongo"
    else if withRchardet then
      gemdir + "/Gemfile.rchardet"
    else
      gemdir + "/Gemfile";

  lockfile =
    if withMongo then
      gemdir + "/Gemfile.mongo.lock"
    else if withRchardet then
      gemdir + "/Gemfile.rchardet.lock"
    else
      gemdir + "/Gemfile.lock";

  gemset =
    if withMongo then
      gemdir + "/gemset.mongo.nix"
    else if withRchardet then
      gemdir + "/gemset.rchardet.nix"
    else
      gemdir + "/gemset.nix";

  gems = bundlerEnv {
    name = "whatweb-env";
    inherit ruby_3_4;
    inherit gemdir;
    inherit gemfile lockfile gemset;
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "whatweb";
  version = "0.6.4";

  src = fetchFromGitHub {
    owner = "urbanadventurer";
    repo = "whatweb";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-0oU3DAAwJRGUrrzxZUm8TZ1dlsufzTlonkgdVYsh4mQ=";
  };

  prePatch = ''
    substituteInPlace Makefile \
      --replace "/usr/local" "$out" \
      --replace "/usr" "$out" \
      --replace "bundle install" "echo 'Skipping bundle install in nix build'"
  '';

  buildInputs = [ gems ];

  nativeInstallCheckInputs = [ versionCheckHook ];

  installPhase = ''
  n
      modes, balancing speed and thoroughness, making it suitable for both quick reconnaissance and detailed penetration
      testing. Its plugins use multiple detection methods to reliably identify technologies, even when sites attempt to
      obscure their software.
    ''
    + lib.optionalString withMongo ''

      This build includes MongoDB support and character set detection capabilities, which may impact performance.
    ''
    + lib.optionalString (withRchardet && !withMongo) ''

      This build includes character set detection capabilities, which may impact performance.
    '';
    mainProgram = "whatweb";
     license = lib.licenses.gpl2Only;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})
