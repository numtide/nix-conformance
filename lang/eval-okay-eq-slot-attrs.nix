let
  id = x: x;
  s = {
    inherit id;
    a = {
      f = id;
      g = x: x;
    };
  };
in
[
  (s == s)
  (s.a == s.a)
  ({ b = s.a; } == { b = s.a; })
  (s == { inherit id; a = s.a; })
  (builtins.attrValues s.a == builtins.attrValues s.a)
]
