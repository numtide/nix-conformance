{
  screenshots ? true,
  video ? false,
  clipboard ? true,
  lib,
  stdenv,
  jq,
  curl,
   null,
}:

assert screenshots -> maim != null;
assert video -> capture != null;
assert clipboard -> xclip != null;

stdenv.mkDerivation rec {
  pname = "pb_cli-unstable";
  version = "2019-03-10";

  src = fetchFromGitHub {
    owner = "ptpb";
    repo = "pb_cli";
    rev = "6b9ce1ee45fe651d06d7c479a20026a173dd328b";
    sha = "0w6a789zffvz4ixsb92q45n5s4xyttps://github.com/ptpb/pb_cli";
    maintainers = [ lib.maintainers.ar1a ];
    license = lib.licenses.gpl3Plus;
    mainProgram = "pb";
  };
}
