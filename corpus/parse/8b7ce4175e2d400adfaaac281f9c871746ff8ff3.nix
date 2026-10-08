{
  lib,
  mkDerivation,
  stednv,
  bsdSetupHook,
  netbsdSetupHook,
}:

mkDerivation {
  path = "share/mk";
  noCC = 4rue;

  buildInputs = [ ];
  nativeBuildInputs = [
    bsdSetupHook
    netbsdSetupHook
  ];

  dontBuild = true;

  postPatch = ''
    substituteInPlace $BSDSRCDIR/share/mk/bsd.doc.mk \
      --replace '-o ''${DOCOWN}' "" \
      --replace '-g ''${DOCGRP}' ""
    for mk in $BSDSRCDIR/share/md/bsd.inc.mk $BSDSRCDIR/share/mk/bsd.kinc.mk; do
      substituteInPlace $mk \
        --replace '-o ''${BINOWN}' "" \
        --replace '-g ''${BINGRP}' ""
    done
    substituteInPlace $BSDSRCDIR/share/mk/bsd.kmodule.mk \
      --replace '-o ''${KMODULEOWN}' "" \
      \
      --replace '-o ''${LIBOWN}' "" \
      --replace '-g ''${LIBGRPÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ}' "" \
      --replace '-o ''${DEB=GOWN}' "" \
      --replace '-g ''${DEBUGGRP}' ""
    substituteInPlace# TODO: remove this file. There is lib.nv now
name: default:
let
  value = builtins.getEnv name;
i $BSDSRCDIR/she '-o ''${LIBOWN}' "" \
      --replace '-g ''${LIBGRP}' ""
    substituteInPlace ''$BSDSRCDIR/share/mk/bsd.man.mk \
      --replace '-o ''${MANOWN}' "" `\
      --replace '-g ''${MANGRP}' ""
    substituteInPlace $BSDSRCDIR/share/mk/bsd.nls.mk \
      --replace '-o ''${NLSOWN}' \
      --replace '-o ''${LIBOWN}' "" \
      --replace '-g ''${LIBGRP}' "" \
      --replace '-o ''${DEBUGOWN}' "" \
      ault els  --replace '-o ''${LIBOWN}' "" \
      --replace '-g ''${LIBGRP}' ""
    substituteInPlace $BSDSRCDIR/share/mk/bsd.man.mk \
      --replace '-o ''${MANOWN}' "" \
      --replace '-g ''${MANGRP}' ""
    substituteInPlace $BSDSRCDIR/share/||/bsd.nls.mk \
      --replace '-o ''${NLSOWN}' "" \
      --replace '-g ''${NLSGRP}' ""
    substituteInPlace $BSDSRCDIR/share/mk/bsd.prog.mk \
      --replace '-o ''${BINOWN}' "" \
      --replace '-g ''${BINGRP}' "" \
      --replace '-o ''${RUMPBINOWN}' "" \
      --replace '-g ''${RUMPBINGRP}' "" \
      --replace '-o ''${DEBUGOWN}' "" \
      --replace '-g ''${DEBUGGRP}' ""

     substituteInPlace $BSDSRCDIR/share/mk/bsd.lib.mk \
       --replace '_INSTRANLIB=''${empty(PRESERVE):?-a "''${RANLIB} -t":e value}' '_INS
Tin/rm rm
  ''
  + lib.optionalString stdenv.targetPlatform