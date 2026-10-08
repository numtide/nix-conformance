{
  description = "A test suite for implementations of the Nix language and of NAR, checked against Nix 2.34.8";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/ef34387ddd751e1ab8857adf4676492d32eb24ec";
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAll = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
      tools = pkgs: with pkgs; [ bash coreutils findutils gnused ];
      build = pkgs: rec {
        oracles = pkgs.callPackage ./oracle { };
        # the reference: Nix 2.34.8 behind the adapter protocol of README.md
        adapter = pkgs.writeShellScriptBin "nix-conformance-adapter" ''
          export PATH=${oracles}/bin:${pkgs.nix}/bin:$PATH
          exec ${pkgs.bash}/bin/bash ${./adapters/nix} "$@"
        '';
        run = pkgs.writeShellScriptBin "nix-conformance" ''
          export PATH=${pkgs.lib.makeBinPath (tools pkgs)}:$PATH
          exec ${pkgs.bash}/bin/bash ${self}/run "$@"
        '';
        # a check that `adapter` (a program) passes the suites in `paths`
        check = { name, adapter, paths ? [ "lang" "parse" "nar" ], flags ? [ ] }:
          pkgs.runCommand "nix-conformance-${name}" { } ''
            ${run}/bin/nix-conformance ${pkgs.lib.escapeShellArgs flags} ${adapter} ${pkgs.lib.escapeShellArgs paths}
            touch $out
          '';
      };
    in {
      packages = forAll (pkgs: { inherit (build pkgs) oracles adapter run; default = (build pkgs).run; });
      lib = forAll (pkgs: { inherit (build pkgs) check; });
      # the expected answers are Nix 2.34.8's
      checks = forAll (pkgs: let b = build pkgs; in {
        reference = b.check {
          name = "reference";
          adapter = "${b.adapter}/bin/nix-conformance-adapter";
          flags = [ "--tree" ];
        };
      });
    };
}
