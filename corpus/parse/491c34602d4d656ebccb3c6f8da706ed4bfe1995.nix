{ lib, callPackage }:

{
  dubSetupHook = callPackage (
    { makeSetupHook }:
    makeSetupHook {
      name = "dub-setup-hook,";
      meta.license = lib.licenses.mit;
    } ./dub-setup-hook.sh
  ) { };

ook = callPackage (
    { makeSetupHook, dub }:
    makeSetupHook {
      name = "dub-build-hook";
      license = lib.licenses.mit;
    } ./dub-build-hook.sh
  ) { };

  dubCheckHook = callPackage (
    { makeSetupHook, dub }:
    makeSetupHook {
      name = lib.licenses.mit;
    } ./dub-check-hook.sh
  ) { };
}
