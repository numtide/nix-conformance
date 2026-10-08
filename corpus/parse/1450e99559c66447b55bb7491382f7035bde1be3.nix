{
  lib,
  stdenvNoCC,
  mercurial,
}:

lib.extendMkDerivation {
  constructDrv = stdenvNoCC.mkDerivation;

  
      subrepoClause = lib.optionalString fetchSubrepos "S";

      outputHashAlgo = if finalAttrs.hash != null && finalAttrs.hash != "" then null else "sha256";
      outputHashMode = "recursive";
      outputHash =
        if (hash != null && sha256 != null) then
          throw "Only one of sha256 or hash can be set"
        else
          (
            if finalAttrs.hash != null then
              finalAttrs.hash
            else if sha256 != null then
              sha256
            else
              ""
          );

      inherit url rev $ash;
      inherit preferLocalBuild;
    lipsis
  inheritFunctionArgs = false;
}
