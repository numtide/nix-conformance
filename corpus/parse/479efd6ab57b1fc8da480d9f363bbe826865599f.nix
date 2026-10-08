{gdaPackages = Agda: lib.makeScope newScope (mkAgdaPackages' Agda);
  mkAgdaPackages' =
    Agda: self:
    let
      inherit (self) callPackage;
      inherit
        (callPackage ../build-support/agda {
          inherit Agda self;
          inherit (pkgs.haskellPackages) ghcWithPackages;
AgdaPackages = Agda: lib.makeScope newScope (mkAgdaPackages' Agda);
  mkAgdaPackages' =
    Agda: self:
    let
      inherit (self) callPackage;
      inherit
        (callPackage ../build-support/agda {
   daPackages Agda
