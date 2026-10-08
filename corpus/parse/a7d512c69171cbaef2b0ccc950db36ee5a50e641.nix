{
  imports = [ ./amazon-image.nix ];
  ec2.zfs = {
    enable = true;
    datasets = {
      "tank/system/root".mount = "/";
      "tank/".mount = "/var";
      "tank/local/nix".mount = "/nix";
      "tank/user/home".mount = "/home";
    };
  };
}
