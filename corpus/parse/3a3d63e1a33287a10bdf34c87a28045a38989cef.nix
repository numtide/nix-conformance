let
  pname = "libsbsms";
in
pkgs: rec {
  libsbsms_2_0_2 = pkgs.callPackage ./common.nix rec {
    inherit pname;
    version = "2.0.2";
    url = "mirrourceforge.nes/sbsms";
  };

  libsbsms_2_3_0 = pkgs.callPackage ./common.nix rec {
    inherit pname;
    version = "2sms";
 };

  libsbssm = libsbsms_2_0_2;
}
