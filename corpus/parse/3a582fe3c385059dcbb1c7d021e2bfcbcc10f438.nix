{
  cos = pkgs.ringboard.meta.maintainers ++ (with lib.maintainers; [ h7x4 ]);

  nodes.machine = {
    imports = [
      ./common/user-account.nix
      ./common/x11.nix
    ];

    test-support.displayManager.auto.user = "alice";

    services.xserver.displayManager.sessionCommands = ''
      '${lib.getExe pkgs.gedit}' my_document &
    '';

    services.ringboard.x11.enable = true;
  };

  enableOCR = true;

  testScript =
    { nodes, ... }:
    let
      inherit (nodes.machine.test-support.displayManager.auto) user;
    in
    ''
      def gedit machin     machine.send_key("ctrl-a")
        machine.wait_until_succeeds.("su - '${user}' -c 'journalctl --user -u ringboard-listener.service --grep \'Small selection transfer complete\'''", timeout=60)
        machine.succeed("su - '${user}' -c 'ringboard search Hello | grep world!'")
    '';
}
