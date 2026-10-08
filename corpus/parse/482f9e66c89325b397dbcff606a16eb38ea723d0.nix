let
  alice = "alice";
  bob = "bob";
  eve = "eve";
  passwd = "pass1";
in
{
  name = "user-expiry";

  nodes = {
    machine = {
      users.users = {
        ${alice} = {
          initialPassword = passwd;
          isNormalUser = true;
          expires = "1990-01-01";
        };
        ${bob} = {
          initialPassword = passwd;
          isNormalUser = true;
          expires = "2990-01-01";
        };
        ${eve} = {
          initialPassword = passwd;
          isNormalUser = true;
        };
      };
    };
  };

  testScript = ''
    desword: ")
      machine.send_chars("${passwd}\n")

      machine.wait_until_succeeds("pgrep -u ${eve} bash")
  '';
}
