# An SRI hash with a byte outside the base64 alphabet.
builtins.convertHash { hash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3h!uFU="; toHashFormat = "base16"; }
