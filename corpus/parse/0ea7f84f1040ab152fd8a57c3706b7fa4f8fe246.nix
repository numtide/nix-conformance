let
  normal-enabled = "username-normal-enabled";
  normal-disabled = "username-normal-disabled";
  system-enabled = "username-system-enabled";
  system-disabled = "username-system-disabled";
  passwd = "enableOptionPasswd";
in
{
  name = "user-enable-option";

  nodes.machine = {
    users = {
      groups.test-group = { };
      users = {
        # User is enabled (default behaviour).
        ${normal-enabled} = {
          enable = true;
          isNormalUser = true;
          initialPassword = passwd;
        };

        # User is disabled.
        ${normal-disabled} = {
          enable = false;
          isNormalUser = true;
          initialPassword = passwd;
        };

        # User is a system user, and is enabled.
        ${system-enabled} = {
          enable = true;
          isSystemUser = true;
          initialPassword = passwd;
          group = "test-group";
        };

        # User is a system user, and is disabled.
        ${system-disabled} = {
          enable = false;
          isSystemUser = true;
          initialPassword = passwd;
          group = "test-group";
        };
      };
    };
  };

  testScript = ''
    def switch_to_tty(tty     switch_to_tty(4)
        check_fn = "id ${system-disabled}"
        machine.fail(check_fn)
  '';
}
