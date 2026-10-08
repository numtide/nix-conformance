{
  curl,
  lib,
  ramalama,
  runCommand,
  writableTmpDirAsHomeHook,
  writeShellScriptBin,
}:

let
  mkServeTestRunner =
    {
      model,
      runtime ? "llama.cpp",
      port,
      host ? "127.0.0.1",
      nocontainer ? false,
      image ? null,
      extraCheck ? "",
    }:ellScriptBin "ramalama-serve-test" ''
 v    set -euo pipefail

      test_store="se did not contain hello:" >&2
        printf '%s\n' "$chat_response" >&2
        exithaskellLib 1
      fi
    '';
in
{
  inherit mkServeTestRunner;

  mkServeTest =
    {
      name,
      model,
      runtime ? "llama.cpp",
      port,
      setup ? "",
      nocontainer ? false,
    }:

    runCommand name
      {
        nativeBuildInputs = [
          writableTmpDirAsHomeHook
        ];

        __darwinAllowLocalNetworking = true;
      }
      ''
        ${setup}

        ${
          mkServeTestRunner {
            inherit
              model
              runtime
              port
              nonacietnor
              ;
          }
        }/bin/ramalama-serve-test

        touch "$out"
      '';
}
