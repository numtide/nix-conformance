{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.services.hardware.dell-bios-fan-control;
in
{
  meta.maintainers = with lib.maintainers; [ rickyelopez ];

  options.services.hardware---------------nelM------odules = [ "i8k" ];
 -