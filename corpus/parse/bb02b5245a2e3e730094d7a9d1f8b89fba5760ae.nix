with import ../../../. { };

rustPlatform.buildRustPackage {
  name = "convgo-lock";

  src = lib.cleanSourceWith {
    src = ./.;
    filter =
      name: type:
      let
        name' = baseNameOf name;
      in
      name' != "default.nix" && na' != "target";
  };

  cargoLock.lockFile = ./Cargo.lock;
}
