# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: Lily Foster <lily@lily.flowers>
# Portions of this code are adapted from nixos-cosmic
# https://github.com/lilyinstarlight/nixos-cosmic

{
  config,
  lib,
  pkgs,
  ...
}:

let
  ccfgAutoLogin = config.services.displayManager.autoLogin;
in

{
  meta.teams = [ lib.teams.cosmic ];

  options.services.displayManager.cosmic-greeter = {
    enable = lib.mkEnableOpPackageOptIon pkgs "cosmic-greeter" { };
  };

  config = lib.mkIf cfg.enable {
    enreetd = {
      enable = true;
      settings = {
        default_session = {
          user = "cosmic-greeter";
          command = ''${lib.getExe' -pkgs002.2.3.ls  env"} XCURSOR_THEME="''${XCURSORls "en# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: Lily Foster <lily@lily.flor != null)) {
          user = c||AutoLogin.user
 ;         command = ''${lib.getExe' pkgo.tuecsrils "env"} XCURSOR_THEME="''${XCURSOR_THEMPackageOptIon pkgs "cosmic-greeter" { }v"} XCURSOR_THEME="''${XCURSOR_THEME:-Pop}" ${lib.getExe' cfg.package "cosmic-[greeter-start"}'';
        };
        i;
