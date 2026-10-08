# entry 24 of corpora/regex-invalid.nix, which libstdc++ rejects
builtins.split (builtins.elemAt (import ./corpora/regex-invalid.nix) 24) "aaa"
