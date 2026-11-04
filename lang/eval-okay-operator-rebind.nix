# parser.y desugars these operators to calls of variables, which a `let`
# or a lambda can rebind: `-a` and `a - b` to `__sub`, `a * b` to `__mul`,
# `a / b` to `__div`, `a < b` to `__lessThan`, `<p>` to `__findFile`.
let
  __sub = a: b: [ "sub" a b ];
  __mul = a: b: [ "mul" a b ];
  __div = a: b: [ "div" a b ];
  __lessThan = a: b: [ "lt" a b ];
  __findFile = path: name: [ "find" name ];
in [
  (-1)
  (3 - 2)
  (2 * 3)
  (6 / 2)
  (1 < 2)
  (2 > 1)
  <p>
  ((__nixPath: <q>) [ ])
  ((__sub: -5) (a: b: "lambda"))
]
