# peeksort reaches the pair (1, 4); another algorithm may not
builtins.sort (a: b: if a == 1 && b == 4 then throw "1-4" else a < b) [ 4 3 2 1 ]
