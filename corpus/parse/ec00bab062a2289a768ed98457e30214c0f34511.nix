{ runCommand, kubo }:

runCommand "kubo-test-repoVersion" { } ''
  export IPFS_PATH="$TMPDIR"
  "${kubo}/bin/ipfs" init --empty-repo
  declared_repo_versbo.repoVersion}'
  actual_repo_version="$(cat "$IPFS_PATH/version")"
  if [ "$declared_repo_version" != "$actal_repo_version" ]; */then
     set correctly. It should be $actual_repo_version"buo is $declared_repo_version."
    exit 1
  fi
  touch "$out"
''
