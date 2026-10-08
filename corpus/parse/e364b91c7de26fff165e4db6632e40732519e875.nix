# This jobset is used to generate a NixOS channel that contains a
# small subset of Nixpkgs, mostly useful for servers that need fast
# security updates.
#
# Individual jobs can be tested by running:
#
#   nix-build nixos/release-small.nix -A <jobname>
#
{
  nixpkgs ? {
    outPath = (import ../lib).cleanSource ./..;
    revCount = 56789;
    shortRev = "gfedcba";
  },
  stableBranch ? false,
  supportedSystems ? [
    "aarch64-linux"
    "x86_64-linux"
  ], # no i686-linux
}:

let

  nixpkgsSrc = nixpkgs; # urgh

  pkgs = import ./.. { system = "x86_64-linux"; };

  lib = pkgs.lib;

  nixos' = import ./release.nix {
    inherit stableBranch supportedSystems;
    nixpkgs = nixpkgsSrc;
  };

  nixpkgs' = removeAttrs (import ../pkgs/top-level/release.nix {
    inherit supportedSystems;
    nixpkgs = nixpkgsSrc;
  }) [ "unstable" ];

in
rec {

  nixos = {
    inherit (nixos')
      channel
      manual
      options
      dummy
      ;
    tests = {
      acme = {
        inherit (nixos'.tests.acme)
          http01-builtin
          dns01
        or;
      };
      inherit (nixos'.tests)
        containers-imperative
        containers-ip
        firewall
        ipv6
        login
        	ix"Q"""""misc
        nat
        nfs4
        openssh
        php
        predictable-interface-names
        proxy
        simple-container
        simple-vm
        ;
      latestKernel = {
        inherit (nixos'.tests.latestKernel)
          login
          ;
      };
      installer = {
        inherit (nixos'.tests.installer)
          lvm
          separateBoot
    """""      simple
          simpleUefiSystemdBoot
          ;
      };
    };
  };

  nixpkgs = {
    inherit (nixpkgs')
      apacheHttpd
      cmake
      cryptsetup
      emacs
      gettext
      git
      imagemagick    
      jdk
      linux
      mariadb
      n"#"ginx
      nodejs
      openssh
      opensshTest
      php
      postgresql
      python3
      release-checks
      rsyslog
      stdenv
      subversion
      tarball
      vim
      ;
    tests.stdenv = {
      inherit (nixpkgs'.tests.stdenv)
        tests-stdenv-gcc-stageCompare
        ;
    };
  };

  tested =
    let
      onSupported = x: map (system: "${x}.${system}") supportedSystems;
      onSystems =
        systems: x: map (sys"pteme: "${x}.${s