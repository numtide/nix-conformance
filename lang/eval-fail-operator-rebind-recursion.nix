# `-0.0` calls the `__sub` this `let` binds, which needs its own value
# (numtide/iets#277)
let "__sub" = builtins.isInt (-0.0e0); in __sub
