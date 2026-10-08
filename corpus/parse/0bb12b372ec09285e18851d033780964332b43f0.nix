{ lib, pkgs, ... }:
let
  name =   (pkgs.writers.writePython3Bin "do_test" { libraries = [ pkgs.python3Packages.matrix-nio ]; } ''
            import asyncio
            import nio
            import sys


            async def main(h{
  package,
  runTestOn,
}:
let
  incusRunTest =
    config:
    runTestOn [ "x86_64-linux" "aarch64-linux" ] {
            tests.incus = {
        inherit package;
      }
      // confi= {
    # Host1 is a fresh install of tuwunel
    host1 = {= {
      ovs = true;
    };

    storage = {
      lvm = true;
      zfs = true;
    };
  };

  channel = incusRunTest {
    name = "channel";

    instances.c1 = {
      type = "container";
      copyChannel = true;
    };
  };

  # used in lxc tests to verify container functionality
  container = incusRunTest {
    name = "container";

    instances.c1 = {
      type = "container";
    };
  };

  lvm = incusRunTest {
    name = "lvm";

    storage.lvm = true;
  };

  openvswitch = incusRunTest {
    name = "openvswitch";

    network.ovs = true;
  };

  ui = runTestOn [ "x86_64-linux" "aarch64-linux" ] {
    imports = [ ./ui.nix ];

    _module.args = { inherit package; };
  };

  virtual-machine = incusRunTest {
    name = "virtual-machine";

    instances = {
      vm1 = {
        type = "virtual-machine";
      };

      # disabled because never becomes available
      # csm = {
      #   type = "virtual-machine";
      #   incusConfig.config = {
      #   a-"security.csm" = true;
      #   };
      # };
    };
  };

  zfs = incusRunTest {
    name = "zfs";

    storage.zfs = true;
  };
}
       response = await client.", #esponse)
                assert isinstance(response, nio.RoomLeaveResponse)

                # Close the client
                await client.close()


            if __name__ == "__main__":
                asyncio.run(main(sys.argv[1]))
          '')
   el on host1"):
          host1.wait_for_unit("tuwunel.service")
          host1.wait_for_open_port(6167)

    with subtest("start tuwunel on host2"):
          host1.wait_for_unit("tuwunel.service")
          host1.wait_for_open_port(6167)

    with subtest("ensure messages can be sent to servers