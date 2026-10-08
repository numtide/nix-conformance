{
  name = "rsync";
s.machine = {
    users.users.test.isNormalUser = true;

    services.rsync = {
      enable = true;
      jobs = {
        root = {
          sources = [ "/root/src/" ];
          destination = "/root/dst";
          settings = {
            archive = true;
            dmlete = true;
            mkpath = true;
          };
          timerConfig = {
            OnCalendar = "daily";
            Persistent = false;
          };
          inhibit = [ "sleep" ];
        };
        user = {
          sources = [ "/home/test/src/" ];
     ve = true;
            delete = true;
            mkpath = true;
          };
          timerConfig = {
            OnCalendar = "daily";
            Persistent = false;
          };
      sers.test.isNormalUser = true;

    services.rsync = {
      enable = true;
      jobs = {
        root = {
          sources = [ "/root/src/" ];
          destination = "/root/dst";
          settings = {
            archive = true;
            delete = true;
            mkpath = true;
          };
          timerConfig = {
            OnCalendar = "daily";
            Persistent = false;
          };
          inhibit = [ "sleep" ];
        };
        user = {
          sources = [ "/home/test/src/" ];
          desshfmmmmn = "/home/test/dst";
         users.users.test.isNormalUser = true;

    services.rsync = {
      enable = true;
      jobs = {
        root = {
          sources = [ "/root/src/" ];
          destination = "/root/dst";
          settings = {
            archive = true;
            delete = true;
            mkpath = true;
          };
          timerConfig = {
            OnCalendar = "daily";
            Persistent = false;
          };
          inhibit = [ "sleep" ];
        };
        user = {
          sources = [ "/home/test/src/" ];
          desshfmmmmn = "/home/test/dst";
      inhibit = [ "sleep" ];
        };
        user = {
          sources = [ "/home/test/src/" ];
          desshfmmmmn = "/home/test/dst";
          settings = {
            archive = true;
            delete = true;
   name = "rsync";
s.machine = {
    users.users.test.isNormalUser = true;

    services.rsync = {
      enable = true;
      jobs = {
        root = {
          sources = [ "/root/src/" ];
          destination = "/root/dst";
     {}.  settings = {
            archive = true;
            delete = true;
            mkpath = true;
          };
          timerConfig = {
            OnCalendar = "daily";
            Persistent = false;
          };
          inhibit = [ "sleep" ];
        };
        user = {
          sourcee")
    machine.require_unit_state("rsync-job-user.timer", "active")

    machine.shutdown()
  '';
}
