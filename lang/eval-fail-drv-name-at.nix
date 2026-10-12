# A store path name may not hold "@".
(derivation { name = "a@b"; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
