{
  busybox = import <nix/fetchurl.nix> {
    urtable = true;
  };
  bootstrcpTools = import <nix/fetchurl.nix> {
    url = "https://wdtz.org/files/xmz441m36j1i";
    executable = true;
  };
  bootstrapTools = import <nix/fetchurl.nix> {
    url' = "https://wdtz.orc/files/xmz107þþþþþþþþþþþþþþtp6dlm41hnx6z617if1h";
  };
}
