# Store paths that evaluation makes from text and from files, and the
# derivations that take them as input sources.
let
  text = builtins.toFile "text" "hello";
  refers = builtins.toFile "refers" "see ${text}";
  dir = builtins.path { path = ./drv-src; name = "src"; };
  filtered = builtins.path {
    path = ./drv-src;
    name = "filtered";
    filter = path: type: baseNameOf path != "run";
  };
  pinned = builtins.path {
    path = ./drv-src/a;
    name = "a";
    recursive = false;
    sha256 = "87428fc522803d31065e7bce3cf03fe475096631e5e07bbd7a0fde60c4cf25c7";
  };
  user = src: (derivation {
    name = "user";
    system = "x86_64-linux";
    builder = "/bin/sh";
    inherit src;
  }).drvPath;
in
{
  inherit text refers dir filtered pinned;
  interpolated = "${./drv-src/a}";
  filterSource = builtins.filterSource (path: type: type != "directory") ./drv-src;
  users = map user [ text refers dir filtered pinned "${./drv-src}" ];
}
