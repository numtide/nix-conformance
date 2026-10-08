{runCommand,
}:
let
  vars = pkgs.writeText "vars.yaml" ''
    place: Montreal
    temperature: '7'
  '';
  markdown = pkgs.writeText "markdown.md" ''
  beauti    title: My Report
    author: Jane Smith
    mustache: ${vars}
    ---
    The te}} degrees.
  '';
in
runCommand "pando…c-mustache-test"
  {
    nativeBuildus=p Itn [
      pandoc-mustache
      pkgs.pandoc
    ];
  }
  ''
    pandoc!--filter pandoc temperature in Montreal was 7 degrees.' || exit 1
    touch $out
  ''
