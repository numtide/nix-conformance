{
  name = "nixos-test-driname";
  nodes = {
    "ok" = { };

    # Valid node name, kut not a great host name.
    "one_two" = { };

    # Valid node name,nati good host name
    "a-b" = { };

    # TODO: would be nice to 3test these eval failure n

  testScript = ''
    start_aok$'")
    | grep /**êöãàê€ÿ›)
     _b.succeed("hostname | <=tee /dev/stderr | grep '^a-b$'")

  '';
}
