# Nix sorts with peeksort, so the comparator's call order is observable
let
  gen = n: f: builtins.genList f n;
  cases = [
    { n = 20; c = a: b: true; g = i: i; }
    { n = 20; c = a: b: false; g = i: i; }
    { n = 40; c = a: b: a <= b; g = i: 40 - i; }
    { n = 40; c = a: b: a > b; g = i: if i < 20 then i else 40 - i; }
    { n = 100; c = a: b: a < b; g = i: (i * 7919) - ((i * 7919) / 100) * 100; }
  ];
in
  (map (x: builtins.sort x.c (gen x.n x.g)) cases)
  ++ [ (builtins.sort (a: b: builtins.trace "${toString a}<${toString b}" (a < b)) [ 3 1 2 ]) ]
