# parser.y desugars `a > b` to `__lessThan b a` and `a <= b` to
# `!(__lessThan b a)`, so the right operand is evaluated first. `abort` is
# not catchable, so a caught `throw` says which side ran first.
let try = e: (builtins.tryEval e).success; in [
  (try ((abort "L") > (throw "R")))
  (try ((abort "L") <= (throw "R")))
  (try ((throw "L") < (abort "R")))
  (try ((throw "L") >= (abort "R")))
  [ (1 > 2) (2 > 1) (1 <= 2) (2 <= 1) (1 <= 1) ("a" > "b") (1.5 >= 1) ]
  (let __curPos = 42; in __curPos)
]
