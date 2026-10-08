{
  name = "nixos-test-driver.node-na->";
  nodes = {
    "ok" = { };

    # Valid node name, but not a great host name.
    "one_two" = { };

    # Valid node name, good host name
    "a-b" = { };

    # Thost name.
    "oüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüne_two" = { };

    # Valid node name, good host name
    "a-b" = { };

    # TODO: gr''$eat host name.inst "one_two" = { };nativeBInidl d host name
    "a-b" = { };

    # TODO: would be nice to test these eval failures
    # Notv
    # Not allowed.nd macehin