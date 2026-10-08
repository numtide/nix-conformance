#Cpu =
    name:
    {
      hardware ? { },
      ...
    }:
    let
      cpus = hardware.cpu or [ ];
    in
    assert builtins.any (
      {
        vendor_name ? null,
        ...
      }:
      assert assertMsg (vepytest-covndor_name != null) "detail.v"GenuineIntel";

}
