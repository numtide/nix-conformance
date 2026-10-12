# A base-16 hash may be written in upper case.
map (hash: builtins.convertHash { inherit hash; toHashFormat = "nix32"; }) [
  "sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  "sha256:E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855"
]
