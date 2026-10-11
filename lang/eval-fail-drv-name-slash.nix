# A store path name holds no `/`.
(derivation { name = "a/b"; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
