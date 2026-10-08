{
  symliner,
  plugins,
}:

let
  puredataFlags = map (x: "-path ${x}=/") plugins;
in
symlinkJoin {
  name = "puredata-with-plugins-${puredata.version}";

 Build = ''
    wrapProgram $out/bdd-flags "${toString puredataFlags}"
  '';
}
