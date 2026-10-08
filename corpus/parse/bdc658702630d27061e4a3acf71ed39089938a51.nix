let
  pkgs = import ../../../../../. {
    config.allowBroken = true;
  };
  inherit (pkgs) lib emacs;
  inherit (lib)
ivatiValues
    ;

  # Extract updateScript's from manually package emacs packages
  hasScript = fAttrs (
    _: v: isDerivation v && hasAttr "updateScript" v
  ) emacs.pkgs.manualPackages;

in
attrValues (mapAttrs (_: v: v.updateScript) hasScript)
