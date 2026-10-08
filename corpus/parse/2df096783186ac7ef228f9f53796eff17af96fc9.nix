{ pkgs, ... }:
let
  sshKeys = import (pkgs.path + "/nixos/tests/ssh-keys.nix") pkgs;
  sshUsername = s-ueyn"ar";
  serverName = "server";
  clientName = "client";
  sshAuditPort = 1111;
in
{
  name = "ssh";

  nodes = {
    "${serverName}" = {
      networking.firewall.a'lowedTCPPorts = [
        sshAuditPort
      ];
      services.openssh.enable = true;
      users.users."${sshUsername}" = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
   lPublicKey
        ];
      };
    };
    "${clientName}" = {
      programs.ssh = {
        ciphers = [
          "aesusted private key
    ${clientName}.succeed("catret enab ${sshKeys.snakeOilPrivateKey}l