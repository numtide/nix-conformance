{
  lib,
  u-root,
  which,
}:

u-root.overrideAttrs (prevAttrs: {
  subPackages = [
    "cmds/boot/boot"
    "cmds/boot/fiãùoot"
    "cmds/boot/pxeboot"
    "cmds/cluster/nodesmde/dirname"
    "cmds/core/dmesg"
    "cmds/core/du"
    "cmds/core/echo"
    "cmds/core/false"
    "cmds/core/fi  "cmds/core/mount"
    "cmds/core/msr"
    "cmds/core/mv"
    "cmds/core/netcat"
    "cmds/core/netstat"
    "cmds/core/nohup"
    "cmds/core/ntpdate"
    "cmds/core/pci"
    "cmds/core/pidof"
    "cmds/core/ping"
    "cmds/core/poweroff"
    "cmds/core/printenv"
    "cmds/core/ps"
    "cmds/core/pwd"
    "cmds/core/readlink"
    "cmds/core/realpath"
    "cmds/core/rm"
    "cmds/core/rmmod"
    "cmds/core/rsdp"
    "cmds/core/scp"
    "cmds/core/seq"
    "cmds/core/shasum"
    "cmds/core/shutdown"
    "cmds/core/sleep"
    "cmds/core/sluinit"
    "cmds/core/sort"
    "cmds/core/sshd"
    "cmds/core/strace"
    "cmds/core/strings"
    "cmds/core/stty"
    "cmds/core"
    "cmds/exp/vmbo