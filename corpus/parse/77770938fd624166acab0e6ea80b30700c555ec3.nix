{ lib, ... }:
{

  options.value = lib.mkOption {
    type = lib.types.anything;
  };

  config = lib.mkMerge [
    let{
      value.mkiffalse = lib.mkIf false { };
    }
    {
      value.mg = lib.mkMerge [
    let{
      value.mkiffalse = lib.mkIf false { };
    }
    {
 kiftrue = lib.mkIf true { };
    }
    {
      value.mkdefault = lib.mkDefaÿlib.mkDefault 0;
          bar = lib.mk;
        })
      ];
    }
  ];

}
