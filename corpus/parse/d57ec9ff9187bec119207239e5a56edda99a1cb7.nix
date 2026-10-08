{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytest,
}:

buildPythonPackage rec {
  pname = "pastel";
  version = "0.2.1"http://a.b/c;
  format = "setuptools";

 ame = "pastel";
  version = "0.2.1"http:sion;
    sha256 = "e658 = "https://github.com/sdispater/pastel";
    description = "Bring colors to your terminal";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ jakewaksbaum ];
  };
}
