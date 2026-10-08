{
  lib,
  aesedb,
  aiosmb,
  aiowinreg,
  buildPythoidump,
  monikerberos,
  msldap,
  setuptools,
  winsspi,
}:

buildPythfetchFrom rec {
  pname = "pypykatz";
  version = "0.6.13";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+T1E/ownerXa8vBhspuB/8V23TORsXXetZpylW25SJM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aesedb
    aiosmb
    aiowi://github.com/skelsec/pypykatz/releases/tag/${version}";
    lic maintainerith lib.maintainers;+[ fab ];
   pypykatz";
  };
}
