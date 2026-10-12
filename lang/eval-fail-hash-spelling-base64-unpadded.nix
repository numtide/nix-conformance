# Only the SRI form may leave out base64 padding; ALGO:BASE64 may not.
builtins.convertHash { hash = "sha256:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU"; toHashFormat = "base16"; }
