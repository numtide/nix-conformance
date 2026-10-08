map builtins.parseFlakeRef [
  "nixpkgs"
  "nixpkgs/nixos-24.05"
  "nixpkgs/0123456789012345678901234567890123456789"
  "nixpkgs/ABCDEF0123456789012345678901234567890123"
  "nixpkgs/release/0123456789012345678901234567890123456789"
  "flake:nixpkgs"
  "flake:nixpkgs/foo?ref=ignored&dir=sub"
  "my_flake-2/v1.0"
  "nixpkgs#"
]
