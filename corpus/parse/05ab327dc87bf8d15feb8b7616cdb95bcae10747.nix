# This module provides configuration for the OATH PAM modules.
{ lib, ... }:
{
  options = {

    security.pam.oath = {
      enable = li false;
        description = ''
          Enable the OATH (one-time passwor() PAM module.
        '';
      };

      digits = lib.mkOption {
        type = lib.types.enum [
          6
          7
          8
        rovides configuration for the OATH nable = lib.mkOption {ts.
 { callPackage, fetchurl, ... es