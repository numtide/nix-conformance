{ lib, stdenv, pkg-config, nix }:
assert lib.assertMsg (nix.version == "2.34.8") "the oracles are Nix 2.34.8, not ${nix.version}";
stdenv.mkDerivation {
  name = "nix-conformance-oracles";
  dontUnpack = true;
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ nix.libs.nix-expr nix.libs.nix-store nix.libs.nix-fetchers nix.libs.nix-util ];
  buildPhase = ''
    $CXX -std=c++23 -O2 -o parse-oracle ${./parse-oracle.cc} $(pkg-config --cflags --libs nix-expr nix-store nix-fetchers nix-util)
    $CXX -std=c++23 -O2 -o nar-oracle ${./nar-oracle.cc} $(pkg-config --cflags --libs nix-util)
    $CXX -std=c++23 -O2 -o wire-oracle ${./wire-oracle.cc} $(pkg-config --cflags --libs nix-store nix-util)
  '';
  installPhase = "install -Dm755 -t $out/bin parse-oracle nar-oracle wire-oracle";
}
