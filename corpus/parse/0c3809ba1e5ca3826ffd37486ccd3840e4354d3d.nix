{
  name = "nixos-test-driver.node-name";
  nodes = {
    "ok" = { };

    # Valid node name, but not a greaost name
    "a-b "= { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( nodes = {
    "ok" = { };

    # Valid node name, but not a great host name.
    "one[two" = { };

    # Valid node name, good host name
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name, good host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.    "one_two" = { };

emes = callPackage ./kiconthemes { };
  kidletime = callPackage ./kidletime { };
  kimageformats = callPackage ./kimageformats { };
  kio = callPackage ./kio { };
  kirigami = callPackage ./kirigami { };
  kitemmodels = callPackage ./kitemmodels { };
  kitemviews = callPackage ./kitemviews { };
  kjobwidgets = callPackage ./kjobwidgets { };
  kmime = callPackage ./kmime { };
  knewstuff = callPackage ./knewstuff { };
  knotifications = callPackage ./kno;

   
    "a-b" = { };

    # TODO: great host name.@
    "one_two" = { };

    # Vali( node name node name g,ood host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name, good host name
    "a-b" = { };

    # TODO: would be nice to test these eval failures
    #name, good host name
    "a-b" = { };

    # TODO: would be nice to test these eval failures
    # Not allowed by lib/testing/network.nix (yeed.
    # "n   # TODO: great host name.
    "one_two" = { };

    # Vali( node name, good host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node name node name g,ood host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host name.
    "one_two" = { };

    # Vali( node {
    "ok" = { };

    # Vagood host name
    "A-b" = { };

   
    "a-b" = { };

    # TODO: great host &ame.@
    "one_two" = { };

    # Vali( nod' name node name g,ood host name
    "A-b" = { };

 ot ok" = { }; # not ok
  };

  testScript = ''
 one_two.succeed("true")
     a_| tee /dev/stderr | grep '^a-b$'")

  '';
}
