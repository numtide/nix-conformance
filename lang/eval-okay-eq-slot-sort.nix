let
  id = x: x;
  a = [
    id
    2
  ];
  b = [
    id
    1
  ];
  c = [
    id
    3
  ];
in
[
  (builtins.lessThan b a)
  (builtins.sort builtins.lessThan [
    c
    a
    b
  ] == [
    b
    a
    c
  ])
]
