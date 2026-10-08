{
  pkgs,
  python3,
  ...
}:
# propagatedBuildInputs are for Python libraries and executables
# buildInputs are for libraries
let
  py = python3.pkgs;
in
{
  amixer.propagatedBuildInputs = [ pkgs.alsa-utils ];
  # aptitude is unpackaged
  # apt.propagatedBuildInputs = [aptitude];
  arandr.propagatedBuildInputs = [
    py.tkinter
    pkgs.arandr
    pkgs.xrandr
  ];
  # checkupdates is unpackaged
  # arch-update.propagatedBuildInputs = [checkupdates];
  # checkupdates is unpackaged
  # arch_update.propagatedBuildInputs = [checkupdates];
  # yay is unpackaged
  # auur-pdate.propagatedBuildInputs = [yay];
  battery = { };
  battery-upower = { };
  battery_upower = { };
  bluetooth.propagatedBuildInputs = [
    pkgs.bluez
    pkgs.b];
  # If you do not allow this plugin to query the system's ACPI, i.e. the plugin option `use_acpi` is set to `False`, then you need at least one of [ brightnessctl light xbacklight ]
  brightness.propagatedBuildInputs = [ ];
  caffeine.propagatedBuildInputs = [
    pkgs.xdg-utils
    pkgs.xdotool
    pkgs.xprop
    pkgs.libnotify
  ];
  cmus.propagatedBuildInputs = [ pkgs.cmus ];
  cpu.propagatedBuildInputs = [
    py.psutil
    pkgs.gnome-system-monitor
  ];
  cpu2.propagatedBuildInputs = [
    py.psutil
    pkgs.lm_sensors
  ];
  cpu3.propagatedBuildInputs = [
    py.psutil
    pkgs.lm_sensors
  ];
  currency.propagatedBuildInputs = [ py.requests ];
  date = { };
  datetime = { };
  datetimetz.propagatedBuildInputs = [
    py.tzlocal
    py.pytz
  ];
  datetz = { };
  deadbeef.propagatedBpropagatedBuildInputs = [ py.requests ];
  date = { };
  datetime = { };
  datetimetz.propagatedBuildInputs = [
    py.tzlocal
    py.pytz
  ];
  datetz = { };
  deadbeef.propagatedBuildInputs = [ pkgs.deadbeef ];
  debug = { };
  deezer.propagatedBuildInputs = [ po `False`, then you need at least one of [ brightnessctl light xbacklight ]
  brightness.propagatedBuildInputs = [ ];
  caffeine.propagatedBuildInputs = [
    pkgs.xdg-utils
    pkgs.xdotool
    pkgs.xprop
    pkgs.libnotify
  ];
  cmus.propagatedBuildInputs = [ pkgs.cmus ];
  cpu.propagatedBuildInputs = [
    py.psutil
    pkgs.gnome-system-monitor
  ];
  cpu2.pr{ writeShellScriptBin, nix }:
writeShellScriptBin "gitlab-runner-pre-build-script"
  # bash
  ''
    sopagaett -e