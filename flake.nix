{
  description = "A test suite for implementations of the Nix language, of NAR and of a Nix daemon client, checked against Nix 2.34.8";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/ef34387ddd751e1ab8857adf4676492d32eb24ec";
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAll = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
      tools = pkgs: with pkgs; [ bash coreutils findutils gnused ];
      build = pkgs: rec {
        wire-serve = pkgs.runCommandCC "wire-serve" { } ''
          mkdir -p $out/bin
          $CC -O2 -Wall -o $out/bin/wire-serve ${./wire/serve.c}
        '';
        oracles = pkgs.callPackage ./oracle { };
        mkAdapter = name: oracles: nix: pkgs.writeShellScriptBin name ''
          export PATH=${oracles}/bin:${nix}/bin:$PATH
          exec ${pkgs.bash}/bin/bash ${./adapters/nix} "$@"
        '';
        # the reference: Nix 2.34.8 behind the adapter protocol of README.md
        adapter = mkAdapter "nix-conformance-adapter" oracles pkgs.nix;
        # another Nix, such as a build of its master, as one more implementation
        adapterFor = nix: mkAdapter "nix-conformance-adapter-${nix.version}"
          (pkgs.callPackage ./oracle { inherit nix; reference = false; }) nix;
        run = pkgs.writeShellScriptBin "nix-conformance" ''
          export PATH=${pkgs.lib.makeBinPath (tools pkgs ++ [ wire-serve ])}:$PATH
          exec ${pkgs.bash}/bin/bash ${self}/run "$@"
        '';
        # a check that `adapter` (a program) passes the suites in `paths`
        check = { name, adapter, paths ? [ "lang" "parse" "nar" "drv" "flake" "wire" ], flags ? [ ] }:
          pkgs.runCommand "nix-conformance-${name}" { } ''
            ${run}/bin/nix-conformance ${pkgs.lib.escapeShellArgs flags} ${adapter} ${pkgs.lib.escapeShellArgs paths}
            touch $out
          '';
      };
    in {
      packages = forAll (pkgs: { inherit (build pkgs) oracles adapter run wire-serve; default = (build pkgs).run; });
      lib = forAll (pkgs: { inherit (build pkgs) check adapterFor; });
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
