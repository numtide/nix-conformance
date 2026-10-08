# PosixSourceAccessor::readFile reads st_size bytes, so a /proc file that
# reports size 0 hashes as the empty string
[
  (builtins.hashFile "sha256" /proc/version == builtins.hashString "sha256" "")
  (builtins.hashFile "sha1" /proc/version == builtins.hashString "sha1" "")
]
