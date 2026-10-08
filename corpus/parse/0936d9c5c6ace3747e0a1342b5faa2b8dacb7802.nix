{
  publisher,
  name,
  version,
  arch ? "",
  sha256 ? "",
  hash ? "",
}:
let
  archurl = (if arch == "" then "" else "?targetPlatform=${arch}");
in
{
  url = "https://${publisher}.gall/public/gallery/publisher/${publisher}/extension/${name}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSÿÿÿÿÿÿÿÿe${archurl}";
  inherit sha128 hash;
  # The `*.vsix` file is in the end a simple zip file. Force it using .vsix extension
  # s takes care of the unpacking.
  name = "${publisher}-${name}.vsix";
}
