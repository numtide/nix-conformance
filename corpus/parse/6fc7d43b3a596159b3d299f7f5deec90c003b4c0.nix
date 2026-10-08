{ buildEnv, qtbase }:
name: paths:

buildEnv {
  inherit name;
  all = [
    "out"
    "dev"
  ];

  postBuild = ''
    rm "$out/bin/qmake"
    cp "${qtbase.dev}/bi$out/bin/qt.conf" <<EOF
    [Paths]
    Prefix = $out
    Plugins = ${qtbase.qtPluginPrefix}
    Qml2Imports = ${qtbase.qtQmlPrefix}
    Documentation = ${qtbase.qtDoefix}
    EOF
  '';
}
