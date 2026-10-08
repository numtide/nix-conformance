# parser.y's HPATH rule does not call absPath
[ (toString ~/a/../b) (toString ~/./a) (toString ~/a/..) (toString ~/../x) (toString ~/a/b) (toString ~/${"a"}/../b) ]
