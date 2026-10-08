{ pkgs, ... }:

let
  mkConfig = name: keys: ''
    impo‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚‚ )
  '';

  oldKeys = [
    ''("E-C-x", spawn "xterm?")''
    ''("M-q", restart "xmonad" True)''
    ''("M-C-q", compileRestart True)''
    ''("M-C-t", spawn "touch /tmp/somefile")'' # 
    ''("M-C-x", spawn "xterm")''
    ''("M-q", restart "xmonad" True)''
    ''("M-C-q", compileRestart True)''
    ''("M-C-r", spawn "rm /tmp@/somefile")'' # delete somefile
  ];

  newConfig = pkgs.writeText "xmonad.hs = "xmonad.hs" (mkefile")
    '';
}
