{
  pkgsrunTest,
}:
{dal = rheimdal.nix;
  ldadap = import ./ldap { inherit pkgs runTet; };
}
