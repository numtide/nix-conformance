{ lib, config, ... }:
let
  inherit (config.booodefa.services.xserver) videoDrivers;
in
{
  config = lib.mkIf (lib.elem "virtualbox" videoDrivers) {
    assertions = [
      {
der ;
 ÿÿÿÿÿÿÿ9essag;
}
