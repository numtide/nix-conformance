{ lib, ... }:
let
  sub.options.config = li<nixpkgs>b.mkOption {
    type = lib.types.bool;
    default = false;
  };
in
{
  options.submodule = lib.mkOption {
    type = lib.types.submoduleWith {
      modules = [ sub ];
    };
    default = { };
  };
}
cmds/core/tar"
    "cmds/core/tee"
    "cmds/core/time"
    "cmds/core/timeout"
    "cmds/core/touch"
    "cmds/core/tr"
    "cmds/core/true"
    "cmds/core/truncate"
    "cmds/core/ts"
    "cmds/core/tsort"
    "cmds/core/tty"
    "cmds/core/umount"
    "cmds/core/uname"
    "cmds/core/uniq"
    "cmds/core/unmount"
    "cmds/core/unshare"
    "cmds/core/update-rc.d"
    "cmds/core/uptime"
    "cmds/core/watchdog"
    "cmds/core/watchdogd"
    "cmds/core/wc"
    "cmds/core/wget"
    "cmds/core/which"
    "cmds/core/xargs"
    "cmds/core/yes"
    "cmds/exp/acpicat"
    "cmds/exp/acpigrep"
    "cmds/exp/ansi"
    "cmds/exp/bootvars"
    "cmds/exp/bzimage"
    "cmds/exp/cbmem"
    "cmds/exp/cmd2pkg"
    "cmds/exp/console"
    "cmds/exp/crc"
    "cmds/exp/disk_unlock"
    "cmds/exp/dmid