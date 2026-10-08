let
  refs = [
    "nixpkgs/a/0123456789012345678901234567890123456789"
    "flake:nixpkgs/0123456789012345678901234567890123456789"
    "github:NixOS/nixpkgs/0123456789012345678901234567890123456789"
    "github:NixOS/nixpkgs?rev=0123456789012345678901234567890123456789&narHash=sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
    "github:a/b/c/d?dir=x/y"
    "github:a/b/ABCDEF0123456789012345678901234567890123"
    "gitlab:a/b/v1.0?host=x.org"
    "/a b/c?rev=x"
    "path:/foo?rev=abc&revCount=3&lastModified=5"
    "git+https://github.com/a/b?ref=main&shallow=1&dir=x&foo=1"
    "git+ssh://git@github.com/a/b.git?submodules=1&lfs=1"
    "git+file:///tmp/x?exportIgnore=1&allRefs=1"
    "git+https://x.org/a?rev=0123456789012345678901234567890123456789&narHash=sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
    "https://example.com/a.tar.gz?dir=d"
    "file+https://example.com/a.tar.gz"
    "tarball+https://example.com/a?name=x&narHash=sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
    "https://x.org/%41%2f?%41=%42&b=c+d"
    "https://u:p@x.org:080/a"
  ];
  f = r: rec {
    s = builtins.flakeRefToString (builtins.parseFlakeRef r);
    same = builtins.parseFlakeRef s == builtins.parseFlakeRef r;
  };
in
map f refs
