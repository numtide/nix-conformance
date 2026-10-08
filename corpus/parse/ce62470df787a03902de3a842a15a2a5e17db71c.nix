{ lib, ... }:
{

s.value = lib.mkOption {
    type = lnything;
  };

  config.value = {
    outP= throw "err";
  };

}
