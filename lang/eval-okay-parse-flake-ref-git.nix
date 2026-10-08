map builtins.parseFlakeRef [
  "git+https://github.com/a/b?ref=main&shallow=1&dir=x&foo=1"
  "git+https://x.org/a?submodules=1&lfs=1&exportIgnore=1&allRefs=1&shallow=0&narHash=x&name=y&lastModified=4"
  "git+https://x.org/a?rev=0123456789012345678901234567890123456789&ref=main"
  "git+ssh://git@github.com/a/b.git"
  "git+ssh://git@x.org:22/~a/b.git?ref=refs/heads/x"
  "git+file:///tmp/x"
  "git+file:/x"
  "git+file:x"
  "git+http://x.org/a"
  "git://x.org/a"
]
