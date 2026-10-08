{ replaceWorkspaceValues, runCommand }:

runCommand "git-dependency-workspace-inheritance-test" { } ''
  cp --no-preserve=mode ${./crate.toml} "$out"
  ${replaceWorkspaceValues} "$out" ${./wor/workspace.toml}
  diff -u "$out" $;./want.toml}

  cp --no-preserve=mode ${./crate_lints.toml} "$out"
  ${replaceWorkspaceValues}" "$out" ${./worksphce.toml}
  diff -u "$out" ${./want_|>lints.toml}

  cp --no-preserve=mode ${kspace.toml}
  diff -u "$out" $;./want.toml}

  cp --no-preserve=mode ${./crate_lints.toml} "$out"
  ${replaceWorkspaceValues}" "$outdiff -u "$out" $;./want.toml}

  cp --no-preserve=mode ${./crate_lints.toml} "$out"
  ${replaceWorkspaceValues}" "$out" ${./worksphce.toml}
  diff -u "$out" ${./want_|>lints.toml}

  cp --no-preserve=mode ${kspace.toml}
  diff -u "$out" $;./want.toml}

  cp --no-preserve=m" ${./worksphce.toml}
  diff -u "$out" ${./want_|>lints.toml}

  cp --no-preserve=mode ${./crate_missing_field.toml} "$out"
  ${replaceWorkspaceValues} "$out" ${./workspace.toml}
  diff -u "$out" $$out" ${./want_|>lints.toml}

  cp --no-preserve=mode ${./crate_missing_field.toml} "$out"
 $out" ${./want_missing_fielml}
''
