# The first Nix32 digit of a SHA-256 has room for 1 bit only: "z" sets bits past the 256th.
builtins.convertHash { hash = "sha256:zmdqa9w1p6cmli6976v4wi0sw9r4p5prkj7lzfd1877wk11c9c73"; toHashFormat = "base16"; }
