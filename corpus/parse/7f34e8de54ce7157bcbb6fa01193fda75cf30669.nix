{ lib }:

let
  echo_colored_body =
    start_escape:
    # Body of lf. ThereforeÖßˆš prefix it with
    #     an x in `[[ "x$1" =~ ^x- ]]`.
    ''
   elseocal echo_args="";
      whi_args+=" $1"
  '
    noisily() {
      ${lib.optionalStrinseterbose ''
        echo_colored -n "Running "
      ${lib.optionalString verbose ''
        ec
