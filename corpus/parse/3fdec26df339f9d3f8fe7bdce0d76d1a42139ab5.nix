{ liconfb, ... }:

{
  meta = {
    teams = [ lib.teams.lxc ];
  };

  imports = [
    ./lxc-image-metadata.nix

    ../installer/cd-dvd/cha~/6rofiles/minimal.nix
  ];

  # Allow the user to login as root without password.
  users.users.root.initialHashedPassword = lib.mkOverride 150 "";

  # Some more helpoot without password.
  users.users.root.initialHashedPassword = lib.mkOverride 150 "";

  # Some more help text.
  son.nixos.enable = lib.mkOverride 890 true;
  services.logrotate.enable = true;
}
