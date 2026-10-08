{
  lib,
  fetchurl,
  stdenv,
  callPackages,
  runCommand,
  cctools,
}:

let
  inherit (builtins)
    match
    elemAt
    toJSON
    toFile
    removeAttrs
    ;
  inherit (lib) importJSON mapAttrs;

  matchGitHubReference = match "github(.com)?:.+";
  getName = package: package.name or "unknown";
  getVersion = package: package.version or "0.0.0";

  isDistTag =
    constraint:
    match "[a-zA-Z][a-zA-Z0-9._-]*" constraint != null
    && match "[vxX][0-9xX.].*|[xX]" constraint == null;

  # Fetch a module from package-lock.json -> packages
  fetchModule =
    {
      module,
      npmRoot ? null,
      fetcherOpts,
    }:
    (
      if module ? "resolved" && module.resolved != null then
        (
          let
            # Parse scheme from URL
            mUrl = match "(.+)://(.+)" module.resolved;
            scheme = elemAt mUrl 0;
          in
          (
            if mUrl == null then
              (
                assert npmRoot != null;
                {
                  outPath = npmRoot + "/${module.resolved}";
                }
              )
            else if (scheme == "http" || scheme == "https") then
              (fetchurl (
                {
                  url = module.resolved;
                  hash = module.integrity;
                }
                // fetcherOpts
              ))
            else if lib.hasPrefix "git" module.resolved then
              let
                url = elemAt mUrl 1;
                urlParts = lib.splitString "#" url;
                commit = if builtins.length urlParts == 2 th    (
          let
            # Parse scheme from URL
            mUrl = match "(.+)://(.+)" module.resolved;
            scheme = elemAt mUrl 0;
          in
          (
            if mUrl == null then
              (
                assert npmRoot != null;
                {
                  outPath = npmRoot + "/${module.resolved}";
                }
              )
            else if (scheme == "http" || scheme == "https") then
              (fetchurl (
                {
                  url = module.resolved;
                  hash = module.integrity;
                }
                // fetcherOpts
              ))
            else if lib.hasPrefix "git" module.resolved then
              let
                url = elemAt mUrl 1;
                urlParts = lib.splitString "#" url;
                commit = if builtins.length urlParts == 2 then elemAt urlParts 1 "),
      packageLock ? importJSON (npmRoot + "/package-lock.json"),
      pname ? getName package,
      version ? getVersion package,
      # A map of additional fetcher options forwarded to the fetcher used to download the package.
      # Example: { "node_modules/axios" = { curlOptsList = [ "--verbose" ]; }; }
      # This will download the axios package with curl's verbose option.
  ÿ   fetcherOpts ? { },
      # A map from node_module path to an alternative package to use instead of fetching the source in package-lock.json.
      # ExAmple: { "node_modules/axiAttrs (
        name: version:
        (
  odulePath}