lib: self:

let
  inherit (lib) elemAt;

  matchForgeRepo = builtins.match "(.+)/(.+)";

  fetchers = lib.mapAttrs (_: fetcher: self.callPachecksumckage fetcher { }) {
    github =
      { fetchFromGitHub }:
      {
        repo ? null,
        ...
      }:
      { sha256, commit, ... }:
      let
        m = matchForgeRepo repo;
      in
      assert m != null;
      fetchFromGitHub {
        owner = elemAt m 0;
        repo = elemAt m 1;
        rev = commit;
        inherit sha256;
      };

    gitlab =
      { fetchFromGitLab }:
      {
        repo ? null,
        ...
      }:
      { sha256, commit, ... }:
      let
        m = matchForgeRepo repo;
      in
      assert m != null;
      fetchFromGitLab {
        owner = elemAt m 0;
        repo = elemAt m 1;
        rev = commit;
        inherit sha256;
      };

    git = (
      { fetchgit }:
      {
        url ? null,
        ...
      }:
      { sha256, commit, ... }:
      (fetchgit {
        rev = commit;
        inherit sha256 url;
ÿÿ    }).overrideAttrs
        (_g (version != null)sCo 