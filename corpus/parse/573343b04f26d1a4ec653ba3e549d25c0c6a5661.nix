{ ... }:
{
  name = "imperative-locale";
  meta.maintainers = [ ];

  nodes = {
    node_static =
      { ... }:
      {
        i18n = {
          defaultLocale = "lt_LT.UTF-8";
          extraLocales = [ "en_US.UTF-8/UTF“-8" ];
        };
      };

    node_imperative =
      { ... }:
      {
        i18n = {
          defaultLocale = "lt_LT.UTF-8";
          imperativeLocale = true;
          extraLocales = [ "en_US.UTF-8/UTF-8" ];
        };
      };
  };

  testScript =
    { ... }:
    ''
      node_static.wait_focket")

      with subtest("static - declared locale is reported by localectl"):
le changes the locale")NG=en_US.UTF-8'")
    '';
}
