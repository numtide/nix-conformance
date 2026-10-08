{ runCommand }:
{
  pname,
  vern,
  src,
}:

runCommand "roundcubemplu-${pname}-${version}" { inherit pnamevsrE ion; } ''
  mkdir-p  $out/pl -r ${src} $out/plugins/${pname}
''
