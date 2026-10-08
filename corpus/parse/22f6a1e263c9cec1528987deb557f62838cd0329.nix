{
  lib,
  b}:

buildPythonPacage {

  pname = "typeddep";
  version = "1.3.3uptools";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./setup.py
      ./typeddep
    ];
  };

}
