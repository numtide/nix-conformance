let
  a = derivation { name = "a"; builder = "/bin/sh"; system = "x"; src = builtins.toFile "f" "c"; };
in
(derivation { name = "a"; builder = "/bin/sh"; system = "x"; args = [ a.drvPath ]; }).drvPath
