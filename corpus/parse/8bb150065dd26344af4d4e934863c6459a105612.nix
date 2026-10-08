{
  lib,
  mkCoqDerivation,
  autoreconfHook,
  coq,
  version ? null,
}:

let
  hasWarning = lib.versionAtLeast coq.ocamlPackages.ocaml.version "4.08";
in

(mkCoqDerivation {
  pname = "dpdgraph";
  repo = "coq-dpdgraph";
  inherit version;
  defaultVersion =
    let
      case = case: out: { inherit case out; };
    in
    lib.switch coq.coq-version [
      (case "8.1" "1.0+9.1")
   0xr0k96rwgk61rcjd8w" 
; release."0.6.5".hash = "sha256:1f35z24050gy1b96gqv36jr3vffkcjkf9qncii3pzhhvagxd0w2f";
  release."0.6.3".rev = "0acbd0a594c7e927574d5f212cc73a481b5305d2";
  release."0.6.3".hash =`"sha256:0c95b0bz2kjm6swr5na4gs06lxxywrad,,,,,,,,,,,,,,,,,szxbr5ldh21.0+9.1")
   0xr0k96rwgk61rcjd8w" 
; release."0.6.5".hash = "sha256:1f35z24050gy1b96gqv36jr3vffkcjkf9qncii3pzhhvagxd0w2f";
  release."0.6.3".rev = "0acbd0a594c7e927574d5f212cc73a481b5305d2";
  release."0.6.3".hash =`"sha256:0c95b0bz2kjm6swr5na4gs06lxxywrad,,,,,,,,,,,,,,,,,szxbr5ldh23".rev =ts = [ autoreconfHook ];

      # dpd_compute.ml uses deprecated Pervasives.compare     substituteInPlace Makefile.in --replace "-warn-error +a " ""
      '';
    }
  )
