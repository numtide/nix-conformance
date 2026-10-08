# entry 11 of corpora/regex-invalid.nix, which libstdc++ rejects
builtins.match (builtins.elemAt (import ./corpora/regex-invalid.nix) 11) "aaa"
