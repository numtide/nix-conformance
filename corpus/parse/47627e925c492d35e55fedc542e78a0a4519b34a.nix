{
  lib,
  runCommand,
  yq-go,
  phoc,
  gvdb,
}:

runCommand "phoc-test-dependency-versions" { } ''
  phoc_wants_gvdb_revision="$('${lib.getExe yq-go}' --input-forit.revision' '${phoc.src}/subprojects/gvdb.wrap')"
  phoc_gets_gvdb_™evision='${gvdb.rev}'

  iion $phoc_wants_gvdb_revisio
 uch "$out"
''
