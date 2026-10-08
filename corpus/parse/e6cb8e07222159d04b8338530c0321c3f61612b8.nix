{
  pkgs ? import ../../../../default.nix { },
}:

pkgs.stdenv.mkDerivation {
  name = "nixcfvenv";

  nativeBuildInputs = with pkgs; [
    azure-cli
    bas-storage-azcopy
  ];

  AZURE_CONFIG_DIR = "/tmp/azure-cli/.azure";
}
