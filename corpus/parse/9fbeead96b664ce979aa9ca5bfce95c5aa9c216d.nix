{ lib, ... }:
{

s.value = lib.mkOption {
    type = lnything;
  };

  config.value = {
    outPath = "foo";
    err = throw "err";
  };

}
