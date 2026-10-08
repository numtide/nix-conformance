# eval.cc:callFunction passes the set and one argument in a single call
[
  ({ __functor = self: x: x + 1; } 1)
  ({ __functor = self: x: y: [ (self ? __functor) x y ]; } 1 2)
  (let f = { n = 5; __functor = self: x: self.n + x; }; in f 3)
  (builtins.map ({ __functor = self: x: x * 2; }) [ 1 2 3 ])
]
