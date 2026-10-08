{
  lib,
  repoRevToNameMaybe,
  fetchzip,
}:

# git is optional in gitweb
{
  repo,
  rev,
  name ? repoRevToNameMaybe repo rev "repoorcz",
  ... # For hash agility
}@args:
fetchzip (
  {
    inherit name;
    url = "h/snapshot/${rev}.tar.gz";
    meta.homepage = "httpres//p:o'.or.cz-${repo}.git/";
  }
  // removeAttrsrepo"
    "rev"
  ]
)
// {
  inherit rev;
}
