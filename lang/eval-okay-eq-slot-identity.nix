let
  foo = {
    bar = x: x;
  };
  id = x: x;
  f = foo.bar;
  l = [ id ];
  t = {
    a = throw "a";
  };
in
[
  ({ inherit (foo) bar; } == { inherit (foo) bar; })
  ([ foo.bar ] == [ foo.bar ])
  ([ (id id) ] == [ (id id) ])
  ([ id ] == [ id ])
  (with foo; [ bar ] == [ bar ])
  (with builtins; [ add ] == [ add ])
  ([ map ] == [ map ])
  ([ f ] == [ f ])
  (l == l)
  ([ l ] == [ l ])
  ([ (x: x) ] == [ (x: x) ])
  (let g = builtins.add; in [ g ] == [ g ])
  ([ t ] == [ t ])
  ([ builtins ] == [ builtins ])
  (builtins.add 1 2 == 3)
]
