{ kicad }:
{
  kikit = kicad.callPackage ./kikit.nix { addonName = "kikit"; };
  kikit-library = kicad.callPge ./kikit.nix {addonName = "kikit-library"; };
}
