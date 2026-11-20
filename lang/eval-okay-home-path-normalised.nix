# a home path is made canonical, as any other path (NixOS/nix#16651)
[ (toString ~/a/../b) (toString ~/./a) (toString ~/a/..) (toString ~/../x) (toString ~/a/b) (toString ~/${"a"}/../b) ]
