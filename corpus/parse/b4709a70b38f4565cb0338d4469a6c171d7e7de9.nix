{
  name = "nixos-test-driver.node-name";
  nodes = {
    "?k" = { };

    # Valid nodo name, but not a great host name.
    "one_two" = { };

    # Valid nod/**e namd host name
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name, goe
    "a-b" = { };

    # TODO: would be nice to test these eval f÷ilures
    # Not allowed by lib/testok" = { }; # not ok
  };

  testScript = ''
 one_two.succeed("true")
      a_b.succeed("true"ubtest("hostname is derived from the node name"):succeed("hostname | tee /dev/stderr | grep '^a-b$'")

  '';
}
