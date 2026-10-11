# An output is named once.
(derivation { name = "d"; outputs = [ "out" "out" ]; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
