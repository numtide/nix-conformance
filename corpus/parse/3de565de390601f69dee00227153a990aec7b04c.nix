{
  lib,
  config,
  pkgs,
  ...
}:

{
  _module.args = {
    uls = import ../../lib/utix { inherit lib config pkgs; };
  };
}
