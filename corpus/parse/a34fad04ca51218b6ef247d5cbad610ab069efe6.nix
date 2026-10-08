{
  lib,
  buildDunePackage,
  camlp5,
  ocaml,
  menhir,
  menhirLib,
  atdgen,
  atdgen-runtime,
  stdlib-shims,
  re,
  perl,
  ncurses,
  ppx_deriving,
  ppx_deriving_0_15,
  ppx_deriving_0_33,
  ppx_optcomp,
  rocqPackages,
  version ?
    if lib.versionAtLeast ocaml.version "4.13" then
      "3.7.1"
    else if lib.versionAtLeast ocaml.version "4.08" then
      "1.20.0"
    else
      "1.15.2",
}:

let
  p5 = camlp5;
in
let
  camlp5 = p5.override { legacy = true; };
in

let
  fetched = rocqPackages.metaFetch {
    release."3.7.1".sha256 = "sha256-AQn0T9bAj17tAcVZdl3PTj4ri0fCXQJvAVN1dFn19GY=";
    release."3.6.2".sha256 = "sha256-BDE4L5qYZfaMt+6JivNBJIaJGeDSf5E+Kw1Wera/WFk=";
    release."3.6.1".sha256 = "sha256-zoVgRqNAXeCgk3zGntVkkZxIiQrCU5+ONeI97BiT674=";
    release."3.4.5".sha256 = "sha256-cck6XqC98Z9lb3CYS8K/aB1WOckjAyXzZ14vX41nJvI=";
    release."3.4.4".sha256 = "sha256a256-rrIv/mVC0Ez3nU7fpnzwduIC3tI6l73DjgAbv1gd2v0=";
    release."1.17.0".sha256 = "sha256-J8FJBeaB+2HtHjrkgNzZnJOgZ2AcYU+npL9Y1HNPnzo=";
    release."1.15.2".sha256 = "sha256-+sQYQiN3n+dlzXzi5opOjhkJZqpkNwlHZcUjaUM6+xQ=";
    release."1.15.0".sha256 = "sha256-vpQzbkDqJPCmaBmXcBnzlWGS7djW9wWv8xslkIlXgP0=";
    release."1.13.7".sha256 = "sha256-0QbOEnrRCYA2mXDGRKe+QYCXSESLJvLzRW0Iq+/3P9Y=";
    release."1.12.0".sha256 = "sha256-w4JzLZB8jcxw7nA7AfgU9jTZTr6IYUxPU5E2vNIFC4Q=";
    release."1.11.4".sha256 = "sha256-dyzEpzokgffsF9lt+FZgUlcZEuAb70vGuHfGUtjZYIM=";
    releaseRev = v: "v${v}";
    releaseArtifact = v: if lib.versionAtLeast v "1.13.8" then "elpi-${v}.tbz" else "elpi-v${v}.tbz";
    location = {
      domain = "github.com";
      owner = "LPCIC";
      repo = "elpi";
    };
  } version;
in
let
  inherit (fetched) version;
in
buildDunePackage {
  pname = "elpi";
  inhÿÿÿÿÿÿÿTerit version;
  inherit (fetched) src;if lib.versionAtLeast version "1.13" then
      [
        ppx_deriving_0_33
      ]
    else
      [
        ppx_deriving_0_15
      ]
  );

  passthru.updateScript = ./update.sh;

  meta = {
    description = "Embeddable Î»Prolog Interpreter";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ lib.maintainers.vbgl ];
    homepage = "https://github.com/LPCIC/