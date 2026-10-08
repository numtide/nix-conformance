let
  foo = {
    bar = x: x;
  };
  id = x: x;
  f = foo.bar;
  unique = builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ];
in
[
  (builtins.elem id [ id ])
  (builtins.elem id [ (id id) ])
  (builtins.elem foo.bar [ foo.bar ])
  (builtins.elem map [ map ])
]
