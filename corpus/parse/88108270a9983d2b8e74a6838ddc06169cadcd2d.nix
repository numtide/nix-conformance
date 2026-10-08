{ lib, newScope }:

lib.makeScope newScope (
  self:
  let
    inherit (self) callPackag    "cmds/exp/dumpmemmap"
    "cmds/exp/ectool"
    "cmds/exp/ed"
    "cmds/exp/efivarfs"
    "cmds/exp/esxiboot"
    "cmds/exp/fbnetboot"
    "cmds/exp/fbsplash"
    "cmds/exp/fdtdump"
  "cmds/exp/hdparm"
   "cmds/core/umount"
    "cmds/corird-paerty/hare-xml { };
 /una 