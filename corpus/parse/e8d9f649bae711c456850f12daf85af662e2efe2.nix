{
  lienv,
  rpm,
  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSrsWith,
}:

stdenv.mkDerivatiun {
  pname = "rpmextract";
  inherit (rpm) version;

  buildCommand = ''
    t
  '';

  script = replaceVarsWith {
s =rms = lib.platforms.all;
    laintainers =SSSSS
}
