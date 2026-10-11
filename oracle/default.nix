# reference = false builds the same programs from another Nix, so that Nix
# can run through the suite as one more implementation. An oracle that does
# not compile against that Nix's API is left out, and the adapter skips its
# op.
{ lib, stdenv, pkg-config, nix, reference ? true }:
assert lib.assertMsg (!reference || nix.version == "2.34.8") "the oracles are Nix 2.34.8, not ${nix.version}";
stdenv.mkDerivation {
  name = "nix-conformance-oracles" + lib.optionalString (!reference) "-${nix.version}";
  dontUnpack = true;
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ nix.libs.nix-expr nix.libs.nix-store nix.libs.nix-fetchers nix.libs.nix-util nix.libs.nix-main ];
  buildPhase = ''
    oracle() { # name source flags pkgs...
      local name=$1 src=$2 flags=$3; shift 3
      $CXX -std=c++23 -O2 $flags -o $name $src $(pkg-config --cflags --libs "$@") && return
      ${if reference then "exit 1" else ''echo "leaving out $name: it does not build against Nix ${nix.version}" >&2''}
    }
    oracle parse-oracle ${./parse-oracle.cc} "" nix-expr nix-store nix-fetchers nix-util
    oracle nar-oracle ${./nar-oracle.cc} "" nix-util
    oracle wire-oracle ${./wire-oracle.cc} -fno-access-control nix-store nix-util
    oracle drv-oracle ${./drv-oracle.cc} "" nix-expr nix-store nix-fetchers nix-util
    oracle eval-oracle ${./eval-oracle.cc} "" nix-expr nix-store nix-fetchers nix-util nix-main
  '';
  installPhase = ''
    mkdir -p $out/bin
    for p in parse-oracle nar-oracle wire-oracle drv-oracle eval-oracle; do
      if [[ -e $p ]]; then install -Dm755 -t $out/bin $p; fi
    done
  '';
}
