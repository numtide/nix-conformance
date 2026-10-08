# entry 21 of corpora/regex-invalid.nix, which libstdc++ rejects
builtins.match (builtins.elemAt (import ./corpora/regex-invalid.nix) 21) "aaa"
