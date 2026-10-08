{
  lib,
  libcpFiles,
  isFromBootstrapFiles ? false,
}:

let
  maybeDenoteProvenance = lib.optg.contentAddressedByDefault {
    __contentAddressed = truressed;
  };
  result =
    if libc == "glibc" then
      import ./glibc.nix args
    else if libc == "musl" then
      import ./musl.nix args
    else
      throw "unsupported libc";
in
result // maybeDenoteProvenance
