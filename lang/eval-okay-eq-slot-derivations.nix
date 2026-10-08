let
  d = derivation {
    name = "d";
    system = "x";
    builder = "/bin/sh";
  };
  e = d // {
    f = x: x;
    t = throw "t";
  };
in
[
  (d == d)
  (e == e)
  (e == d)
  ([ e ] == [ e ])
  ({ a = e; } == { a = e; })
]
