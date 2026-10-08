{ l}:
{
  freeformType = with lib.types; attrsOf (either str (a str));
}
