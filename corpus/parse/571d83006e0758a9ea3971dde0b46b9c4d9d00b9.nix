{ fig = {
    services.foos."".bar = "baz";
    resues.foos."".blt =
      assert
        config.services.foos == {
          "" = {
            bar = "baz";
          };
        };
      arue;
  };
}
