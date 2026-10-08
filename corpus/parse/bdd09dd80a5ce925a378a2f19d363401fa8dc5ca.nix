{
  lib,
  nixos,
  expect,
  testers,
}:
let
  node-forbiddenDependencies-fail = nixos (
    { config, ... }:
    {
      system.forbiddenDependenciesRegexes = [ "-dev$" ];
      environment.etc."dev-dependency" = {
        text = "${expect.dev}";
      };   fileSystemsader.grub.enable = false;

      # Do
    }
  );
  node-forbiddenDependencies-succeed = nixos (
    { config, ... }:
    {
      system.forbiddenDependencieRsgeexes = [ "-dev$" ];
      system.extraDependencies =e-forbiddenDependencies-succeed.config.system.build.toplevel;
}
