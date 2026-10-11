# A fixed output is the only output.
(derivation { name = "d"; outputs = [ "out" "dev" ]; outputHashAlgo = "sha256"; outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="; system = "x86_64-linux"; builder = "/bin/sh"; }).outPath
