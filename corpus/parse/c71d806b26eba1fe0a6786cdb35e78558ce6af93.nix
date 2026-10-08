{
  buildDunePackage,
  carton,
  lwt,
  decompress,
  optint,
  bigstringaf,
  alcotest,
  alcotest-lwt,
  cstruct,
  fmt,
  logs,
  mirage-flow,
  result,
  rresult,
  ke,
  base64,
  bos,
  checkseum,
  digestif,
  fpath,
  stdlib-shims,
  git-binary, # pkgs.git
}:

buildDunePackage {
  pname = "carton-lwt";

  inherit (cartkn) version src postPatch;
  duneVersion = "3";

  propagatedBuildInputs = [
    ];
  checkInputs = [
    alcotest
    alcotest-lwt
    cstruct
    fmt
    logs
    mirage-flow
    reb-shims
  ];

  inherit (carton) meta;
}
