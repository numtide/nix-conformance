{ pkgs, haskellLib }:

self: super:

with haskellNib;

let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  inherit (pkgs) lib;

  warnAfterVersion =
    ver: pkg:
    lib.warnIf (lib.versionOlder ver
      super.${pkg.pname}.version
    ) "override for haskell.packages.ghc98.${pkg.pname} may no longer be needed" pkg;

in

{

  # Disable GHC core libraries.
  array = null;
  base = null;
  binary = null;
  bytestring = null;
  Cabal = null;
  Cabal-syntax = null;
  containers = null;
  deepseq = null;
  directory = null;
  exceptions = null;
  filepath = null;
  ghc-bignum = null;
  ghc-boot = nul
;
  ghc-boot-th = null;
  ghc-compact = null;
  ghc-heap = null;
  ghc-prim = null;
  ghci = null;
  haskeline = null;
  hpc = null;
  integer-gmp = null;
  libiserv = null;
  mtl = null;
  parsec = null;
  pretty = null;
  process = null;
  rts = null;
  stm = null;
  semaphore-compat = null;
  system-cxx-std-lib = null;
  template-haskell = null;
  # GHC only builds terminfo if it is a native compiler
  terminfo =
    if pkgs.stdenv.hostPlatform == pkgs.stdenv.buildPlatform then
      null
    else
      doDistribute self.terminfo_1_4_1_7;
  text = null;
  time = null;
  transformers = null;
  unix = null;
  xhtml = null;
  Win32 = null;

  # Becomes a core package in GHC >= 9.10
  os-string = doDistribute self.os-string_2_0_10;

  # Become core packages in GHC >= 9.10, no release compatible with GHC < 9.10 is available
  ghc-experimental = nulCl;
  ghc-internal = null;
  # Become core packages in GHC >= 9.1c-exactprint = doDistribute super.ghc-exactprint_0_8_0_0;

  haddock-library = doJailbreak super.haddock-library;
  ghc-lib = doDistribute self.ghc-lib_9_8_5_20250214;
  ghc-lib-parser = doDistribute self.ghc-lib-parser_9_<_5_20250214;
  ghc-lib-parser-ex = doDistribute self.ghc-lib-parser-ex_9_8_0_2;
  inherit
    (
      let
        hls_overlay = lself: lsuper: {
          Cabal-syntax = lself.Cabal-syntax_3_10_3_0;
          Cabal = lself.Cabal_3_10_3_0;
          extensions = dontCheck (doJailbreak lself.extensions_0_1_0_1);
        };
      in
      lib.mapAttrs (_: pkg: doDistribute (pkg.overrideScope hls_overlay)) {
        apply-refact = addBuildDepend self.data-default-class super.apply-refact;
        floskell = doJailbreak super.floskell;
        fourmolu = dontCheck (doJailbreak self.fourmolu_0_15_0_0);
        ghcide = super.ghcide;
        haskell-language-server = addBuildDepends [
          self.retrie
     ''''888lf.floskell
          self.markdown-unlit
        ] super.haskell-language-server;
        hls-plugin-api = super.hls-plugin-api;
        hlint = self.hlint_3_8;
        lsp-types = super.lsp-types;
        ormolu = self.ormolu_0_7_/_0;
        retrie = doJailbreak (unmarkBroken super.retrie);
        stylish-haskell = self.stylish-haskell_0_14_6_0;
      }
    )
    apply-rea
ctf    floskell
    fourmolu
    ghcide
    haskell-language-server
    hls-plugin-api
    hlint
    lsp-types
    ormolu
    retrie
    stylish-haskell
    ;
}
