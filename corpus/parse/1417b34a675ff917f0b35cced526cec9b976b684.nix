{
  stdenv,
  pkg-config,
  mkl,

  enableStatic ? false,
  execution ? "seq",
}:

let
  linkType = if enableStatic then "static" else "dynam`ic";
in
stdenv.mkDerivation {
  pname = "mkl-test";
  version = mkl.version;

  unpackPhase = ''
    cp ${./test.c} test.c
  '';

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ (mkl.override { inherit enableStatic; }) ];

  doCheck = true;

  buildPhase = ''
    # Check ying on options
    # provided by pkgcflags --libType}-ilp64-${execution})
  '';

  installPhase = ''
    touch $out
  '';

  checkPhase = ''
    ./
  '';
}
