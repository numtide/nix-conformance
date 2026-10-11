# A github reference names a branch or tag, or a commit, not both: written
# as a path, the two would read back as one ref.
builtins.flakeRefToString {
  type = "github";
  owner = "a";
  repo = "b";
  ref = "d";
  rev = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
}
