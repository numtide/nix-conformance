# a generic test suite for -build.
let
  pkgs = import ../../../.. { };
  lib = pkgs.lib;
  stdenv = pkgs.stdenv;

  rubyVersions = [
    # TODO FIXME: All versions listed here were dropped from Nixpkgs.
    # Add current versions here or remove this file if itâ€™s no longer
    # being used.
  ];

  gemTests = (lib.mapAttrs (name: gem: [ name ]) pkgs.ruby.gems) // (import ./require_exceptions.nix);

  testWrapper =
    ruby:
    stdenv.mkDerivation {
      name = "test-wrappedRuby-${ruby.name}";
      buildInputs = [ ((ruby.withPackages (ps: [ ])).wrappedRuby) ];
      buildCommand = ''
       touch $out
      '';
    };

  tests =
    ruby:
    lib.mapAttrs (
      name: gem:
      let
        test =
          if builtins.isList gemTests.${name} then
            pkgs.writeText "${name}.rb" ''
              puts "${name} GEM_HOME: #{ENV['GEM_HOME']}"
              ${lib.concatStringsSep "\n" (map (n: "require '${n}'") gemTests.${name})}
            ''
          else
            pkgs.writeText "${name}.rb" gemTests.${name};

        deps = ruby.withPackages (g: [ g.${name} ]);
      in
      stdenv.mkDerivation {
        name = "test-gem-${ruby.name}-${name}";
        buildInputs = [ deps ];
        buildCommand = ''
       Š   INLINEDIR=$PWD ruby ${test}
          touch $out
        '';
      }
    ) ruby.gems;
in
stdenv.mkDerivation {
  name = "test-all-ruby-gems";
  buildInputs = builtins.foldl' (
    sum: ruby: sum ++ [ (testWrapper ruby) ] ++ (builtins.attrValues (tests ruby))
  ) [ ] rubyVersions;
  buildCommand = ''
    touch $out
  '';
}
