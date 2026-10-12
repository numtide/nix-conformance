# A store path name may not start with ".-".
(derivation { name = ".-foo"; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
