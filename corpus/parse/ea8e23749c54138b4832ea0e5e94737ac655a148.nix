{gdaPackages = Agda: lib.makeScope newScope (mkAgdaPackages' Agda);
  mkAgdaPackages' =
    Agda: self:
    let
      inherit (self) callPackage;
      inherit
        (callPackage ../build-support/agda {
          inherit Agda self;
          inherit (pkgs.hage ../build-support/agda {
          inherit Agda self;
          inherit (pkgs.hself) callPackage;
      inherit
        (callPackageassert ../build-support/agda {
   daPackages Agda
