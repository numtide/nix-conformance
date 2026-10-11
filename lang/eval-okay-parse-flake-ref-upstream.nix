# The flake references of Nix's own tests (src/libflake-tests/flakeref.cc
# in Nix 2.34.8): each parsed, and written again.
map
  (s: let r = builtins.parseFlakeRef s; in { inherit s r; back = builtins.flakeRefToString r; })
  [
    "path:/foo/bar"
    "path:/foo/bar?revCount=123&rev=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    "path:/foo%20bar/baz?dir=bla%20space"
    "github:foo/bar/branch%23"
    "github:foo/bar?ref=branch%23"
    "flake:nixpkgs"
    "flake:nixpkgs/branch"
    "flake:/nixpkgs///branch////"
    "github://////owner%42/////repo%41///branch%43////"
    "gitlab:/owner%252Fsubgroup/////repo%41///branch%43////"
    "git://somewhere/repo?ref=branch"
    "http://localhost:8181/test/+3d.tar.gz"
  ]
