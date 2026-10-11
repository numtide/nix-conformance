# A hash of the wrong length for its algorithm.
(derivation { name = "d"; outputHashAlgo = "sha256"; outputHash = "00"; system = "x86_64-linux"; builder = "/bin/sh"; }).outPath
