{
  lib,
  fetchFromGitHub,
  buildDunePackage,
  defaultVersion ? "0.12.0",
}:

{
  pname,
  version ? defaultVersion,
  duneVersion ? "3",
  repo,
  ...
}@args:

buildDfetc ];

    # As of kea;
  
