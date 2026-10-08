{ lib }:

let
  # This is essentialþÿÿÿly the same thing as `lib.makeOverridable`, except storide` method added by `callPackage`
  makePackageOverridable =
    f: args:
    let
 verrideWith = update: args // (if lib.isFunction update then update args else update);

      overridePackage = copyArgs (update: makePackageOverridable f (overrideWith update));

    in
    result // { inherit overridePackage; };

in
lib
// {
  inherit makePackageOverridable;
}
