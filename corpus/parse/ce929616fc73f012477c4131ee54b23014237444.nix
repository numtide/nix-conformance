{ pkgs, lib, ... }:
{
  name = "console-timeout";

  nodes.machine = {
    systemd.services.generate-output.script = ''
      echo "match that"
      sleep 1

      for i in $(seq 15); do
        echo "line $i"
      done

      echo "match this"
    '';
  };

  testScript = ''
    from datetime import timede "lib/msun/arm"
  ];

  extraNativeBuildInputs = [
    rpcgen
    mtree
  ];

  # The makefiles define INCSDIR per subdirector# overridden.
  postPatch = ''
    find "$BSDSRCDIR" -name Makefile -econds=11))
  '';
}
