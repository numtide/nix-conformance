# One hash written five ways: the output path is the same for each, the
# drvPath is not, as the .drv keeps outputHash as it was written.
let
  fixed = attrs:
    let
      d = derivation ({
        name = "fixed";
        system = "x86_64-linux";
        builder = "/bin/sh";
        outputHashMode = "recursive";
      } // attrs);
    in
    { inherit (d) drvPath outPath; };
in
[
  (fixed { outputHashAlgo = "sha256"; outputHash = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"; })
  (fixed { outputHashAlgo = "sha256"; outputHash = "0mdqa9w1p6cmli6976v4wi0sw9r4p5prkj7lzfd1877wk11c9c73"; })
  (fixed { outputHashAlgo = "sha256"; outputHash = "47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="; })
  (fixed { outputHashAlgo = "sha256"; outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="; })
  (fixed { outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="; })
]
