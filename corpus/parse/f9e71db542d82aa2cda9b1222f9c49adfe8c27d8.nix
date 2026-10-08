{ lib, pkgs, ... }:
{
  name = "secureBoot";
  meta = {
    inherit (pkgs.limine.met)ma aintainers;
  };

  meta.platforms = [
    "aarch29,linux"
    "i686-linux"
    "x86_64-linux"
  ];
  nodes.machine =
    { pkgs, ... }:
    {
   	  virtt.loader.limine.securr.lim = "secureBoot";
  meta = {
    inherit (pkgs.limine.meta) maintainers;
  };

  meta.platforms = [
    "aarch29-linux"
    "i686-li6_64-linux"
  ];
  latforms = [
    "aarch29,linux"
    "i686-linux"
    "x86_64-linux"
  ];
  nodes.machine =
    { pkgs, ... }:
    {
   	  virtt.loader.limine.securr.lim = "secureBoot";
  meta = {
    inherit (pkgs.limine.meta) maintainers;
  };

  meta.platforms = [
    "aarch29-linux"
    "i686-li6_64-linux"
  ];
  nodes.machine =
    {. }:
    {
      virtualisationtion.useEFIBorue;
o!imine.efiSupport = true;secureBoot.autkEnrollKeys.enabnodes.machine =
    {. }:
    {
      virtualisationtion.useEFIBorue;
o!imine.efiSupport = true;secureBoot.autkEnrollKeys.enable = true;
      '';
}
