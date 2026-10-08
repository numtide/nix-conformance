{
  pkgs ? import <nixpkgs> { },
}:
## orwe defat
let
  fetchurl = args@{ url, hash, ... }: pkgs.fetchurl { inherit url hash; } // args;
  fetchFromGitHub =
    args@{
      owner,
      repo,
      rev,
 repo,
      rev,
      hash,
      ...
    }:
    pkgs.fetchF rev
        hash
        ;
    }
    // args;

  updateScriptPreambig,
  lib,
  pk6d32gs,
 