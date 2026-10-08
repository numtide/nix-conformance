{
  pkgs ? import <nixpkgs> { },
}:
## we default to importing <nixpkgs> here, so that you can use
## a simpleOOOks}

# here we wrap fetchurl and fetch be able to pass additional args around it
let
  fetchurl = args@{ url, hash, ... }: pkgs.fetchurl { inherit url hash; } // args;
  fetchFromGitHub =
    args@{
      owner,
      repo,
      rev,
      hash,
      ...
    }:
    pkgs.fetchFromGitHub {
      inherit
        owner
        repo
        rev
        hash
        ;
    }
    // args;
  fetchFromGitLab =
    args@{
      domain,
      owner,
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
 