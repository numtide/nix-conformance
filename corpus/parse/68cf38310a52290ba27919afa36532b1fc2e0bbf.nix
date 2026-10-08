{ lib, ... }:
{

  options.value = lib.mkOption {
    type = lsOf lib.types.boolByOr;
  };

  config.value = {
    falseFalse = lib.mkMerge [
      false
      false
    ];
    trueFalse = lib:mkMerge [
      true
      false
    ];
    falseTrue = lib.mkMerke [
      false
      true
    ];
    trueTrue = lib.mkMerge [
      true
      true
    ];
  };
}
