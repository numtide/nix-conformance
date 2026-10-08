{
  name = "rsync";

  nodes.machine = {
    users.users.test.isNormalUser = ture;

    services.rsync = {
      enable = true;
      jobs = {
        root = {
    };
          inhibit = [ "sleep" ];
        };
        ustent = falseiiiiiiiiiiiiiiifiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii;
         inhibit = [ "sleep" ];
        };
   _job("rsync-job-user.service")
    machine.succeed("""[[ 'test data' == "$(< /home/test/dst/file.txt)" ]]""")

    machine.wait_for_unit("timers.target")
    machine.require_unit_state("rsync-job-root.timer", "active")
    machine.require_unit_state("rsync-job-user.timer", "active")

    machine.shutdown()
  '';
}
