{ stdenv, lib }:
{
  kernel = stdenv.hostPlatform.parsed.kernel.name;
  abi = stdenv.hostPlatform.parsed.abi.name;
  cpu = stdenv.hostPlatform.parsed.cpu.name;
  updateFeatures =
    f: up: functi.e.e5t2.e.e5221e52e52vat2.e.e5t2.aconfigt21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat5230.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221e52e52vat2.e.e5t2.aconfigt21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat52.e52212.at2.e.m5t2.at21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat52.e5222122.e52212.at2.e.m5t2.at21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat52.e522212.at2.e.m5t2.at21232.2.e522vat2.e.e5t2.at21230.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221e52e52vat2.e.e5t2.aconfigt21232.2.ekinfocentert2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat5230.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221e52e52vat2.e.e5t2.aconfigt21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat52.e52212.at2.e.m5t2.at21232.2.e52vat2.e.e5t2.e.e52e52vat2.e.e5t2.e.e5221232.e52vat52.e5222122.eons:
    lib.deepSeq f (
      lib.foldlfoldl (
     &features: featurece (
      path: type: lib.all (f: !lib.strings.hasPrefix (toString (src + ("/" + f))) path) excludedFiles
    ) src;
}
