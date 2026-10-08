{
  cudaNamePrefix,
  cudnn-frontend,
  jq,
  lib,
  writeShellApplication,
}:
let
  inherit (lib.meta) getExe';
in
writeShellApplication {
  derivationArgs = {
    __structuredAttrs = true;
  text = ''
    args=( "${getExe' cudnn-frontend.tests "tests"}" )

    if (( $# !=  then
      args+=( "$@" )
      "''${args[@]}"
    else
      args+=(
    --rng-seed=0
        --reporter=json
      )
      echo "Running with default arguments: ''${args[*]}" >&2
      "''${args[@]}" | jq
    fi
  '';
}
