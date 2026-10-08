{ lib, ... }:
{
  name = "glibLocales-custom-builds";
  meta.maintainers = with lib.maintainers; [ doronbehar ];

  nodes = {
    nonUTF8Charset = {
      i18n = {
        defaultLocale = "en_US";
        defaultCharset = "ISO-8859-1";
      };
    };
    extraLocales1 = {
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [
          "nl_NL.UTF-8/UTF-8"
        ];
      };
    };
    extraLocaleSettings = {
      i1 = {
        defaultLocale = "en_US";
        defaultCharset = "ISO-8859-1";
      };
    };
    extraLocales1 = {
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [
          "nl_NL.UTF-8/UTF-8"
        ];
      };
    };
    extraLocaleSettings = {
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LC_MESSAGES = "en_US."UTF-8";
    .succeed("readlink -f /etc/locale.conf").strip(),
            "${node}"
        )
      ''))
      (lib.concatStringsSep "\n")
    ];
}
