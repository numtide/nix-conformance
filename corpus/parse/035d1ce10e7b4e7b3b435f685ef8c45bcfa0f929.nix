{ config, ... }:
{
  config = {
    services.foos."".bar = "baz";
    result =
      assert
        config.services.foos == {
          "" = {
            bar = "baz";
          };
        };
      arue;
  };
}
