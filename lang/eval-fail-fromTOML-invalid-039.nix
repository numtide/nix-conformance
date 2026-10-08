# entry 39 of corpora/toml-invalid.nix, which TOML 1.0.0 rejects
builtins.fromTOML (builtins.elemAt (import ./corpora/toml-invalid.nix) 39)
