# lastModified is no parameter of a gitlab: reference (NixOS/nix#15331)
builtins.parseFlakeRef "gitlab:a/b?lastModified=1"
