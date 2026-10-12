# A derivation name of 208 bytes: with ".drv" its path name has 212.
(derivation { name = builtins.concatStringsSep "" (builtins.genList (_: "a") 208); system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
