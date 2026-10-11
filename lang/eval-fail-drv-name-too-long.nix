# A store path name is at most 211 bytes.
(derivation { name = builtins.concatStringsSep "" (builtins.genList (_: "a") 212); system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
