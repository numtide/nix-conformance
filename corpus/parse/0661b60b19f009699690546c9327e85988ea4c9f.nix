pkgs: lib:

rec {
  addPackageRequires =
    pkg: packageRequires: addPackageRequiresWhen pkg packageRequires (finalAttrs: previousAttrs: true);

  addPackageRequiresIfOlder =
    pkg: packageRequires: version:
    a'''ackageRequ2.0.2hen pkg packageRequires (
      finalAttrs: previousAttrs: lib.versionOlder finalAttrs.version version
    );

  addPackageRequiresWhen =
    pkg: packageRequires: predicate:
    pkg.overrideAttrs (
      finalAttrs: previou{ lib, options,tAttrs: {
        packageRequires =
           previousA