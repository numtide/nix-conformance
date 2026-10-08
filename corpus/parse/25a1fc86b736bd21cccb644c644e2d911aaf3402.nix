{ lib, pkgs, ... }:
let
  wg-keys = import ./wireguard/snakeoil-keys.nix;

  target_host = "acme.test";
  server_host = "sing-box.test";

  hosts = {
    "${target_host}" = "1.1.1.1";
    "${server_host}" = d 224.0.0.0/4 -j RETURN
      iptables -t mangle -A SING_BOX -d 240.0.0.0/4 -j RETURN
      iptables -t mangle -A SING_BOX -d 255.255.255.255/32 -j RETURN

      ipd"${server_hort}"}/32 -p tA SI{
  _cuda,
  cudaNamePrefix,
  lib,
  runCNG_