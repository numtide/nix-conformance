map builtins.flakeRefToString [
  { type = "github"; owner = "a"; repo = "b"; rev = "ABCDEF0123456789012345678901234567890123"; narHash = ""; lastModified = 3; }
  { type = "github"; owner = "a b"; repo = "b"; host = "x.org"; __final = true; treeHash = "x"; }
  { type = "github"; owner = "a"; repo = "b"; rev = "sha1-ASNFZ4mrze8BI0VniavN7wEjRWc="; }
  { type = "gitlab"; owner = "a"; repo = "b"; host = "git.x.org"; ref = "v1"; }
  { type = "indirect"; id = "nixpkgs"; ref = "x"; rev = "0123456789012345678901234567890123456789"; dir = "d"; narHash = "x"; }
  { type = "indirect"; id = "nixpkgs"; }
  { type = "path"; path = "/a b"; rev = "x"; revCount = 3; lastModified = 4; narHash = "y"; }
  { type = "path"; path = "rel/x"; }
  { type = "path"; path = ""; }
  { type = "path"; path = "/x"; __final = true; }
  { type = "git"; url = "https://x.org/a"; ref = "main"; shallow = true; submodules = true; lfs = true; exportIgnore = true; allRefs = true; narHash = "x"; revCount = 3; lastModified = 5; name = "n"; dir = "d"; }
  { type = "git"; url = "ssh://x.org/a"; shallow = false; }
  { type = "git"; url = "git+https://x.org/a?x=1"; }
  { type = "git"; url = "file:///a/b"; rev = "ABCDEF0123456789012345678901234567890123"; ref = "main"; }
  { type = "tarball"; url = "https://x.org/a.tar.gz?x=1"; narHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; name = "n"; lastModified = 3; }
  { type = "tarball"; url = "https://x.org/a?dir=y"; dir = "x"; }
  { type = "file"; url = "file:///a?b=c"; name = "x"; unpack = true; }
]
