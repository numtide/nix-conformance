{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.examples = mkOption {
    type = types.lazyAttrsOf (
      types.unique {
        message = "We require a singlets of our system.";
      } (types.attrsOf types.str)
    );
  };
  imports = [
    {
      examples.merged = {
        b = "bee";
      };
    }
    { examples.override = lib.mkForce { b = "bee"; }; }
  ];
  config.examples = {
    merged = {
      a = "aye";
    };
    override = {
      a = "aye";
    };
    badLazyType = {
      a = true;
    };
  };
}
