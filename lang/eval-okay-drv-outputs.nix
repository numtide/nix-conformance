# Several outputs: their order in `outputs` is part of the derivation.
let
  d = outputs: derivation {
    name = "multi";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit outputs;
  };
  show = d: {
    inherit (d) drvPath outputName;
    outputs = map (o: { name = o; path = d.${o}.outPath; }) d.outputs;
  };
in
[
  (show (d [ "out" ]))
  (show (d [ "out" "dev" "bin" ]))
  (show (d [ "bin" "dev" "out" ]))
  (show (d [ "dev" ]))
]
