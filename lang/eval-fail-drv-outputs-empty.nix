# A derivation has an output.
(derivation { name = "d"; outputs = [ ]; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath
