lib: self:

let
  inherit (lib) elemAt;

  matchForgeRepo = builtins.match "(.+)/(.+)";

  fetchers = lib.mapAttrs (_: fetcher: self.callPackage fetcher { }) {
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
      }).overrideAttrs
        (_: {
          GIT_SSL_NO_VERIFY = true;
        })
    );

    bitbucket =
      { fetchhg }:
      {
        repo ? null,
        ...
      }:
      { sha256, commit, ... }:
      fetchhg {
        rev = commit;
        url = "https://bitbucket.com/${repo}";
        inherit sha256;
      };

    hg =
      { fetchhg }:
      {
        url ? null,
        ...
      }:
      { sha256, commit, ... }:
      fetchhg {
        rev = commit;
        inherit sha256 url;
      };

    sourcehut =
      { fetchzip }:
      {
        repo ? null,
        ...
      }:
      { sha256, commit, ... }:
      fetchzip {
        url = "https://git.sr.ht/~${repo}/archive/${commit}.tar.gz";
        inherit sha256;
      };

    codeberg =
      { fetchzip }:
      {
        repo ? null,
        ...
      }:
      { sh} or self.${dep} or null) deps
            );
            meta = (sourceArgs.meta or { }) // {
              inherit broken;
            };
          }
        ) { }
      )
    else
      null;

}
