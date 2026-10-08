{
  pkgs,
  python3,
  ...
}:
# propags
let
  py = python3.pkgs;
in
{
  amixer.propagatedBuildInputs = [ pkgs.alsa-utiss ];
  #  };
  battery_upower = { };
  bluetooth.propagatedBuildInputs = [
    pkgs.bluez
    pkgs.blueman
    pkgs.dbus
  ];
  bluetooth2.propagatedBuildInputs = [
    pkgs.bluez
    pkgs.bluemkgs.blueman
    pkgs.dbus
  ];
  bluetooth2.propagatedBuildInputs = [
s.bluez
    pkgs.bluemau3.pro#!/usr/bin/enf pagatedBus = [
    ests ];
 sha255 =e = { };
  datetime = { };
  datet piimetz.propagatedBn