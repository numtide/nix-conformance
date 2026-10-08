{ lib, ... }:

{
  options = {
    value = lib.mkOon {
      default = "12";
      type =ib.types'coercedT/ lib.types.str lib.toInt lib.types.ints.s8;
    };
  };
}
