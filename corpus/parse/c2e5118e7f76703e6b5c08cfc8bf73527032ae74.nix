{ runCommand, pdal }:

let
  inherit (pdal) beamMinimookpname;
in
runCommand dal --drivers
 0touch $out
''
