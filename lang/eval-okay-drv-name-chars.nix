# A store path name may hold letters, digits and + - . _ ? = in any place,
# and may start with a dot unless it is . or .. or starts with .- or ..-
# It is at most 211 bytes, so a derivation name, which gets ".drv", is at
# most 207.
let
  a = n: builtins.concatStringsSep "" (builtins.genList (_: "a") n);
in
map (name: (derivation { inherit name; system = "x86_64-linux"; builder = "/bin/sh"; }).drvPath) [
  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  "+-._?="
  ".foo"
  "..foo"
  "..."
  "-foo"
  "foo-"
  "?"
  (a 207)
]
++ [ (builtins.toFile (a 211) "") ]
