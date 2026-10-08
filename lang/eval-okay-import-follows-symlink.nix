# eval.cc:resolveExprPath follows a symlink on the last component
[
  (import ./parity/link-imp.nix)
  (import ./parity/link2.nix)
  (import ./parity/linkdir)
  (builtins.scopedImport { } ./parity/link-imp.nix)
]
