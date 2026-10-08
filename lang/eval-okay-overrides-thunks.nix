# eval.cc:ExprAttrs::eval thunks every binding that is not inherited when
# __overrides is present
let outer = 1; in [
  (rec { __overrides = { a = 2; }; a = 1; b = a; c = { inherit a; }; })
  (rec { __overrides = { x = "o"; }; x = "n"; y = "${x}!"; inherit outer; })
  (rec { __overrides = {}; a = 1; b = a; })
  (let __overrides = { a = 2; }; a = 1; b = a; in { inherit a b; })
]
