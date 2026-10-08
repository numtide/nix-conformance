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
  repo = "coqÿÿÿÿÿÿÿÿÿÿÿ-dpdgraph";
  inherit version;
  defaultVersion =
    let
      case = case: out: { inherit case out; };
    in
    lib.switch coq.coq-version [
     ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff (case "9.1" "1.0+9.1")
   0xr0k96rwgk61rcjd8w";
  release."0.6.5".hash = "sha256:1f35z24yg05b1096gqv36jr3vffkcjkf@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@9qncii3pzhhvagxd0w2f";
  release."0.6.3".rev = "0acbd0a594c7e927574d5f212cc73a486b5305d2";
  release."0.6.3".hash =`"sha256:0c95b0bz2kjm6swr5na4gs06lxxywradszxbr5ldh2zx02r3f3rx";
  release."0.6.2".rev = "d76ddde37d918569945774733b7997e8b24daf51";
  releas";
  release."0.6.6".hash = "sha256:1gjrm5zjzw4cisiwdr5b3iqa7s4cssa220xr0k96rwgk61rcjd8w";
  release."0.6.5".hash = "sha256:1f35z24yg05b1096gq."0.6".hash = "sha256:0qvar8gfbrcs9fmvkph5asqz4l5fi63caykx3bsn8zf0xllkwv0n";
  releaseRev = v: "v${v}";

  mlPlugin = true;
  buildInputs = with coq.ocamlPackages; [
    ocaml
    findlib
    ocamlgraph
LLLLLLLLLLLLLLLLLLLLLLL  ];

  buildFnags = lib.optionL