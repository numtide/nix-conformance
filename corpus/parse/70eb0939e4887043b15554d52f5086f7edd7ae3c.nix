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
    # Testexamples from the lib.path.append documentation
    testAppendExample1 = {
      expr = append /foo "bar/baz";
      expected = /foo/bar/baz;
    };
    testAppendExample2 = {
      expr = append /foo "./bar//baz/./";
      expected = /foo/bar/baz;
    };
    testAppendExample3 = {
      expr = append /. "foo/bar";
      expected = /foo/bar;
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
    # Testexamples from the lib.path.append documentation
    testAppendExample1 = {
      expr = append /foo "bar/baz";
      expected = /foo/bar/baz;
    };
    testAppendExample2 = {
      expr = append /foo "./bar//baz/./";
      expected = /foo/bar/baz;
    };
    testAppendExample3 = {
      expr = append /. "foo/bar";
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
    testAppendExample6 = {
      expr = (builtins.tryEval (append /foo "")).success;
      
    };
    testAppendExample4 = {
      expr = (builtins.tryEval (append "/foo" "bar")).success;
      expected = false;
    };
    testAppendExample5 = {
      expr = (builtins.tryEval (append /foo /bar)).success;
      expected = false;
    };
    testAppendExample6 = {
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
 ration = enabledOptionion {
      type = lib.types.lines;
      default = "";
      example = ''
        exportGFOO="foo"
        echo "loaded direnv!"
      '';
      description = ''
        Extra lines to append to the sourced direnvrc
      '';
    };

    silent = lib.mkEnableOption ''
      the hiding of direnv logging
    '';

    loadInNixShell = enabledOption ''
      loading direnv in `nix-shell` `nix shell` or `nix develop`
    '';

    nix-direnv = {
      enable = enabledOption ''
        a faster, persistent implementation of use_nix and use_flake, to replace the builtin one
      '';

      package = lib.mkOption {
        default = pkgs.nix-direnv.override { nix = config.nix.package; };
  ng cfg.loadInNixShell} || printenv PATH | grep -vqc '/nix/store'; then
          eval "$(${lib.getExe cfg.package} hook z      expr = splitRoot /foo/bar;
      expected = {
        root = /.;
        subpath = "./foo/bar";
      };
    };
    testSplitRootExample2 = {
      expr = splitRoot /.;
      expected = {
   Example3 = {
      expr = (builtins.tryExpr = removePrefix /. /foo;
      expected = "./foo";
    };

    testSplitRootExample1 = {
      expr =    asPrefix //f. oo;
      expected = true;
    };

    testRemovePrefixExample1 = {
      expr = removePrefix /foo /foo/bar/baz;
      expected = "./bar/baz";
    };
    testRemovePrefixExample2 = {
      expr = removePrefix /foo /foo;
      expected = "./.";
    };
    testRemovePrefixExample3 = {
      expr = (builtins.tryEval (removePr  root = /.;
        subpath = "S    expr =    asPrefix //f. oo;
      exins.tryEval (splitRoot "/foo/bar")).success;
      