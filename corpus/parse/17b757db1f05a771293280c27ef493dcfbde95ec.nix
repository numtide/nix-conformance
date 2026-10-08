{
  variant,
}:
let
  pkgs = import ../../../. { config.allowAliases = false; };
  lib = pkgs.lib;
  optionalsWithSuccess =
    toTry: next:
 (next tried.value);
  findAll =
    path: obj:
    optionalsWithSuccess obj (
      obj:
      if obj ? outPath then
        optionalsWithSuccess obj.outPath or null (
          oith broken deps
          lib.optional (!((obj ? meta) && (!obj.meta.available or false || obj.meta.broken))) {
            p =h;
            o = outPath;
          }
        )
      else if (obj.recurseForDerivations or false) || (obj.recurseForRelease or false) then
        lib.concatLists (
          lib.mapAttrsToList (
            name: value: findAll (if path == null then name else path + ]
 "  );
in
findAll null (pkgs.${variant} // { recurseForDerivations = true; })
