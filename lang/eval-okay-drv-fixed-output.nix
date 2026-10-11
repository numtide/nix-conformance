# The output path of a fixed-output derivation: each method and algorithm,
# for the hash of the empty string.
let
  fixed = mode: algo: hash:
    let
      d = derivation {
        name = "fixed";
        system = "x86_64-linux";
        builder = "/bin/sh";
        outputHashMode = mode;
        outputHashAlgo = algo;
        outputHash = hash;
      };
    in
    { inherit (d) drvPath outPath; };
  md5 = "d41d8cd98f00b204e9800998ecf8427e";
  sha1 = "da39a3ee5e6b4b0d3255bfef95601890afd80709";
  sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  sha512 = "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e";
in
{
  flat-md5 = fixed "flat" "md5" md5;
  flat-sha1 = fixed "flat" "sha1" sha1;
  flat-sha256 = fixed "flat" "sha256" sha256;
  flat-sha512 = fixed "flat" "sha512" sha512;
  recursive-md5 = fixed "recursive" "md5" md5;
  recursive-sha1 = fixed "recursive" "sha1" sha1;
  recursive-sha256 = fixed "recursive" "sha256" sha256;
  recursive-sha512 = fixed "recursive" "sha512" sha512;
}
