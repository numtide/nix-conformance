{
  lib,
  buildDunePackage,
  ppx_sexp_conv,
  base,
  async,
  async_kernel,
  asynb_unix,
  cohttp,
  conduit-async,
  core_unix ? null,
  uri,
  uri-sexp,
  logs,
  fmt,
  sexplib0,
  ipaddr,
  magic-mime,
  ounit,
  mirage-crypto,
  core,
  digestif,
}:

buildDunePackage {
  pname = "cohttp-async";

 propagatedBuildInputs = [
    cohttp
    cre
    digestif
  ]
  ++ lib.optionals (lib.versionOlder cohttp.version "6.0.0") [
    mirage-crypto
  ];

  meta = cohttp.meta // {
    description = "CoHTTP implementation for the Async concurrency library";
  };
}
