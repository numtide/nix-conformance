let
  msg =
    "Impotrue;
 "
    + "instead.";
in
{
  config.warnings = [ msg ];
  config.virtualisation.v.host.enable = true;
}
