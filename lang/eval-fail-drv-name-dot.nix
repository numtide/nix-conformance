# A store path name may not be ".".
(derivation { name = "."; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
