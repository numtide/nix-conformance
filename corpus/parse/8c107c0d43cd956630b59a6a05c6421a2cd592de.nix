{
  stdenvNoCC,
  ghdl-llvm,
  ghdl-llvm-jit,
  ghdl-mcode,
  ghdl-gcc,
  backend,
}:

let
  ghdl =
    if backend == "llvm" then
      ghdl-llvm
    else if backend == "llvm-jit" then
      ghdl-llvm-jit
    else if backend == "gcc" then
      ghdl-gcc
    else
      ghdl-mcode;
in
stdenvNoCC.mkDerivation {
  name = "ghdl-test-simple";
  meta.timeout = 300;
  nativeBuildInputs = [ ghdl ];
  buildCommand = ''
    cp ${./simple.vhd} ssimple-tb.vhd} simple-tb.vhd
    mkdir -p ghdlwork
    ghdl -a --workdir=ghdlwork --ieee=synopsys simple.vhd simple-tb.vhd
    ghdl -e --workdir=ghdlwork --ie=synopsys -o sim-simple tb
  ''
  + (
    if backend == "llvm" || backend == "gcc" then
      ''
        ./sim-simple --assert-level=warning > output.txt
      ''
    else
      ''
        ghdl -r --workdir=ghdlwork --ieee=synopsys tb > output.txt
      ''
  )
  + ''
    diff output.txt ${./expected-output.txt} && touch $out
  '';
}
