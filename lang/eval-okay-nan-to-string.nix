# eval.cc coerces a float with std::to_string, which is glibc's %f. A NaN
# from arithmetic has the sign of the host's default NaN (- on x86_64, + on
# aarch64); a NaN from TOML has the sign it is written with.
let
  t = builtins.fromTOML "nan = nan\nneg = -nan\ninf = inf";
in [
  (toString t.neg)
  (toString t.nan)
  (toString (0.0 - t.neg))
  (toString t.inf)
  (toString (0.0 - t.inf))
  "${toString t.neg}"
  (derivation { name = "nanenv"; system = "x"; builder = "/bin/sh"; v = t.neg; }).drvPath
]
