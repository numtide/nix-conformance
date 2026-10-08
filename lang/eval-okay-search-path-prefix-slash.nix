# search-path.cc compares the whole prefix, which may hold a slash
[
  (import <a/b/a.nix>)
  (import (builtins.findFile builtins.nixPath "a/b/b.nix"))
  (builtins.findFile builtins.nixPath "a/b" == <a/b>)
]
