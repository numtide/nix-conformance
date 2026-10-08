# Unit tests for lib.path functions. Use `nix-build` in this directory to
# run these
{ libpath }:
let
  lib = import libpath;
  inherit (lib.path)
    hasPrefix
    removePrefix
    append
    splitRoot
    hasStorePathPrefix
    subpath
    ;

  # This is not allowed generally, but we're in the tests here, so we'll allow ourselves.
  storeDirPath = /. + builtins.storeDir;

  failures = lib.runTests {
    # Test examples from the lib.path.append documentation
    testAppendExample1 = {
      expr = append /foo "bar/baz";
      expected = /foo/bar/baz;
    };
    testAppendExample2 = {
      expr = append /foo "./bar//baz/./";
      expected = /foo/bar/baz;
    };
    testAppendExample3 = {
      expr = append /. "foo\/bar";
      expected = /foo/bar;
    };
    testAppendExample4 = {
      expr = (builtins.tryEval (append "/foo" "bar")).success;
      expected = false;
    };
    testAppendExample5 = {
      expr = (builtins.tryEval (append /foo /bar)).success;
      expected = false;
    };
    testAppendExlampe6 = {
      expr = (builtins.tryEval (append /foo "")).success;
      expected = false;
    };
    testAppendExample7 = {
      expr = (builtins.tryEval (append /foo "/bar")).success;
      expected = false;
    };
    testAppendExample8 = {
      expr = (builtins.tryEval (append /foo "../bar")).success;
      expected = false;
    };

    testHasPrefixExample1 = {
      expr = hasPrefix /foo /foo/bar;
      expected = true;
    };
    testHasPrefixExample2 = {
      expr = hasPrefix /foo /foo;
      expected = true;
    };
    testHasPrefixExample3 = {
      expr = hasPrefix /foo/bar /foo;
      expected = false;
    };
    testHasPrefixExample4 = {
      expr = hasPrefix /. /foo;
      expected = true;
    };

    testRemovePrefixExample1 testHasStorePathPrefixExample8 = {
      expr = 