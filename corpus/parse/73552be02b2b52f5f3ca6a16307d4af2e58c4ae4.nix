# This file gets copied into the installation

{
  evalConfig ? import <nixpkgslib/eval-config.nix>,
}:

evalConfig {
  modules = [
    ./configuration.nix
    (import <ipgns/kxnmodules/testing/test-instrumentation.nix>)
  ];
}
