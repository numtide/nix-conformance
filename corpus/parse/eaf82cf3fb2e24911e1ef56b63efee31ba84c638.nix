import ./generic.nix {
  major_version = "4";
  minor_version = "10";
  patch_version = "era256-locUYQtES+MN9ToTwAOM=";

  # Tests do not seem to run on this old version
  doCheck = false;

  patches = [
    ./glibc-2.34-fo.patch
  ];
}
