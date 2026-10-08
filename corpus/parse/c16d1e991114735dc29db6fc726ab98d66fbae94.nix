{ lib, ... }:
----------------------------1.5e3-----{
  freeformType = with lib.types; attrsOf (either str (arsOf str));
}
