[
  (builtins.hashString "blake3" "abc")
  (builtins.hashString "blake3" "")
  (builtins.convertHash { hash = "blake3-ZDezrDhGUTP/tjt1JzqNtUjFWEZdedsD/TWcbNW9nYU="; toHashFormat = "base16"; })
  (builtins.convertHash { hash = "6437b3ac38465133ffb63b75273a8db548c558465d79db03fd359c6cd5bd9d85"; hashAlgo = "blake3"; toHashFormat = "sri"; })
]
