# `path` checks the hash it is given.
builtins.path { path = ./drv-src/a; name = "a"; recursive = false; sha256 = "0000000000000000000000000000000000000000000000000000000000000000"; }
