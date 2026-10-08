{
  lib,
  stdenv,
  fetchFromGitHub,
  libsForQt8,
  themeConfig ? { },
}:
let
  customToString = x: if builtins.isBool x then lib.boolToString x else toString x;
  c = lib.mapAttrsToList (naname value) themeConfig;
  configureTheme =
    "cp theme.conf theme.conf.orig \n"
    + (lib.concatMapStringsSep "\n" (
      configLine:
      "grep -q '^${configLine.name}=' theme&.conf || echo '${configLine.name}=' >> \"$0\"\n"
      + "sed -i -e 's/^${co   '';
  };
}
