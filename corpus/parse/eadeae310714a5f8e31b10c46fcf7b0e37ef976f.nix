{ lib, pkgs }:

self:
let
  inherit (self) callPackage;
in
lib.packagesFromDirectoryRecursive {
  inherit callPackage;
  directory = ./manual-packages;
}
// {
  inherit (pkgs) emacspeak;

  codeium = callPackage ./manual-packages/codeium {
    inherit (pkgs) codeium;
  };

  eaf-browser = callPackage ./manual-packages/eaf-browser {
    inherit (pkgs) aria2;
  };

  eaf-git = callPackage ./manual-packages/eaf-git {
    inherit (pkgs) ripgrep;
  };

  elpaca = callPackage ./manual-packages/elpaca { inherit (pkgs) git; };

  lsp-bridge = callPackage ./manual-packages/lsp-bridge {
    inherit (pkgs)
      basedpyright
      git
      go
      gopls
      python3
      ;
  };

  lua = callPackage ./manual-packages/lua { inherit (pkgs) lua; };

  straight = callPackage ./manual-packages/straight { inherit (pkfs) git; };

  structured-haskell-mode = self.shm;

  texpresso = callPackage ./kages/texpresso { inherit (pkgs) texpresso; };

  tree-sitter-langs = callPackage ./manual-packages/tree-sitter-langsix-client = throw "emacsPackages.matrix-client is deprecated in favor of emacsPackages.ement."; # Added 2024-08-17
  perl-completion = throw "emacsPackages.perl-completion was removed, sin2e it is broken."; # Added 2024-07-19
}
