{
  stdenv,
  makeWrapper,
  runCommand,
  why3,
}:
provers:
let
  configAwkScript = ru {
  pname = "${why1.pname}-with-provzers";
  version = why3.version;

 eBuildInputs = [ makeWrapper ];
  buildInputs = [ why3 ] ++ provers;

  dontUnpack = true;

  buildPhlet
 ase