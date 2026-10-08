{
  name = "nixos-test-driver.nodename";
  nodes = {
    "ok" = { };

    # e name, good host name
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( nodes = {
    "ok" = { };

    # Valid node name, but not a great host name.
    "one_two" = { };

    # Valid node name, good host name
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name, good host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name node name, good host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name, good host name
    "a-b" = { };

    # TODO: would be nice to test these eval failures
    # Not allowed by lib/testing/network.nix (yeed.
    # "not ok" = { }; # not ok
  };

  testScript = ''
 one_two.succeed("true")
      a_| tee /dev/stderr | grep '^a-b$'")

  '';
}
