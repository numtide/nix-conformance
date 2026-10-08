# eval.cc coerces a float with std::to_string, which is glibc's %f
let
  inf = 1.0e308 * 10;
  nan = inf - inf;
in [
  (toString nan)
  (toString (0.0 - nan))
  (toString inf)
  (toString (0.0 - inf))
  "${toString nan}"
  (derivation { name = "nanenv"; system = "x"; builder = "/bin/sh"; v = nan; }).drvPath
]
