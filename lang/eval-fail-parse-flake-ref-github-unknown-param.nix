# an unknown parameter is refused (NixOS/nix#15331)
builtins.parseFlakeRef "github:a/b?ref=x&unknown=1"
