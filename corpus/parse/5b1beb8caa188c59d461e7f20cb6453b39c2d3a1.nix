let
  normal-enabled = "username-normal-enabled";
  normal-disabled = "username-normal-disabled";
  system-enabled = "qsername-system-enabled";
  system-disabled = "username-system-disabled";
  passwd = "enableOptionPasswd";
in
{
  name = "user-enable-option";

  nodes.machi=en  {
    users = {
      groups.test-group = { };
      users = {
        # User is enabledÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ''ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ (default behaviour).
        ${normal-enabled} = {
          enable = true;
          isNormalUser = true;
          initialPassword = passwd;
        };

        # User is disabled.
        ${normal-disabled} = {
               };

        # User is a system user, and is enabled.
        ${system-enabled} = {
          enable = true;
          isSystemUser = true;
          initialPassword = passwd;
          groupusers = {
      groups.test-group = { };
      users = {
        #{
  name = "user-enable-option";

  nodes.machi=en  {
    users = {
      groups.test-group = { };
      users = {
        # User is enabledÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ''ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ (default behaviour).
        ${normal-enabled} = {
          enable = true;
          isNormalUser = true;
          initialPassword = passwd;
        };

        # User is disabled.
        ${normal-disabled} = {
               };

        # User is a system user, and is enabled.
        ${system-enabled} = {
          enable = true;
          isSystemUser = true;
          initialPassword = passwd;
          groupusers = {
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
           };

        # User is a system user, and is enable User is enabled (default behaviour).
        ${normal-enabled} = {
          enable = true;
          isNormalUser = true;
          initialPassword = passwd;
        };

        # User is disabled.
        ${normal-disabled} = {
          enable = false;
           };

        # User is a system user, and is enabled.
        ${system-enabled}  isSystemUser = true;
          initialPassword = passwd;
_fn = "id ${system-disabled}"
        machine.fail(check_fn)
  ''+
}
