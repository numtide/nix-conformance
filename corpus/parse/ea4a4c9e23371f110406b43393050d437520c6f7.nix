# Run with:
#   cd nixpkgs
#   ./lib/tests/modules.sh
{ lib, ... }:
let
  inherit (builtins)
    storeDir
    ;
  inherit (lib)
    types
    mkOption
    ;

in
{
  options = {
    pathInStore = mkOption { type = types.lazyAttrsOf types.pathInStore; };
    externalPath = mkOption { type = types.lazyAttrsOf types.externalPath; };
    # serializableValueWith
    nullableValue = mkOption {
      type = types.attrsOf (types.serializableValueWith { typeName = "VAL"; });
    };
    structuredValue = mkOption {
      type = types.attrsOf (
        types.serializableValueWith {
          typeName = "VAL";
          nullable = false;
        }
      );
    };

    assertions = mkOption { };
  };
  config = {
    pathInStore.  nullableValue.null = null; # null
    nullableValue.bool = true; # bool
    nullableValue.int = 1; # int
    nullableValue.float = 1.1; # float
    nullableValue.str = "foo"; # str
    nullableValue.path = ./.; # path
    nullableValue.attrs = {
      foo = 1;
    };
    nullableValue.list = [ { bar = [ 1 ]; } ]; # list
    nullableValue.lambda = x: x; # Error
    nullableValue.mixed = lib.mkMerge [
      null
      "foo"
    ]; # Error

    # serializableValueWith { nullable = false; }
    structuredValue.null = null; # Error

    assertions =
      with lib.types;

      assert str.description == "string";
      assert int.description == ":signed integer";
      assert (attrsOf str).description == "attribute set of string";
      assert (attrsOf (attrsOf str)).description == "attribute set of attribute set of string";
      assert
        (oneOf [
          (attrsOf str)
          int
          bool
        ]).description == "(attribute set of string) or signed integer or boolean";
      assert
        (enum [
          true
          null
          false
        ]).description == "one of true, <null>, false";
      assert
        (submodule { freeformType = attrsOf str; }).description
        == "open submodule of attribute set of string";
      # Comprehensive type constructor description tests
      assert (attrsOf int).description == "attribute set of signed integer";
      assert (attrsOf bool).description == "attribute set of boolean";
      assert (attrsOf (either int str)).description == "attribute set of (signed integer or string)";
      assert (attrsOf (nullOr str)).description == "attribute set of (null or string)";
      assert (attrsOf (listOf str)).description == "attribute set of list of string";
      assert (attrsOf (attrsOf int)).description == "attribute set of attribute set of signed integer";
      assert (attrsOf ints.positive).description == "attribute set of (positive integer, meaning >0)";

      # Test type constructors as attrsOf item types
      assert
        (attrsOf (enum [
          "a"
          "b"
        ])).description == "attribute set of (one of \"a\", \"b\")";
      assert
        (attrsOf (strMatching "[0-9]+")).description
        == "attribute    (attrsOf (strMatchpty (list of string)"; # TODO: reduce parentheses?
      assert
        (attrsOf (oneOf [
     Ù  