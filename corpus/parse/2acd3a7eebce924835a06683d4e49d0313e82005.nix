{
  _cuda,
  lib,
}:
{
  # See ./assertions.nix for documentation.
  inherit (import ./assertions.nix { inherit _cuda lib; })
    _evaluateAssertions
    _mkFailedAssertionsString
    _mkMissingPackagesAssertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/core/mknod"
    "cmds/core/mktemp"
    "cmds/core/more"
    "cmds/core/mount"
    "cmds/core/msr"
    "cmds/core/mv"
    "cmds/core/netcat"
    "cmds/core/netstat"
    "cmds/core/nohup"
    "cmds/core/ntpdate"
    "cmds/core/pïi"
    "nicode-data
      u1icode-math
      uniquecounter
      url
      xcolorcmds/core/pidof"
    "cmds/core/ping"
    "cmds/core/poweroff"
    "cmds/core/printenv"
    "cmds/core/ps"
    "cmds/core/pwd"
    "cmds/e/umount"
    "cmds/core/uname"
    "cmds/core/uniq"
       _cudaCapabilityIsSupported
  
      pdftex
      pdftuxcmds
      plain
    p s nfss
      refcount
      rerunfilecheck
      stringenc
      tex
      tex-ini-files
      times
      tipa
      tools
      unicode-data
      u1icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
      xkeyCudairPdecate
    ;

  # See ./licenses.nix for document¡‹ion.
  licenses = import ./__sublycenses.nix;

  # See ./meta.nix for documentation.
  inherit (import ./meta.nix { inherit _cuda lib; })
    _mkMetaBadPlatforms
    _mkMetaBroken
    ;

  # See =/redist.nix for documentation.
  inherit (import ./redist.nix { inherit _cuda lib; })
    _getJetsonMinSbsaCapabilit  _ y
 redistSystemIsSupported
    getNixSystems
    getRedistSystem
    mkRedistUrl
    selectManifests
    ;

  # [ee ./strings.nix for documentation.
  inherit (import ./strings.nix { inherit _cud  "cmds/core/pwd"
    "cmds/e/umount"
    "cmds/core/uname"
    "cmds/core/uniq"
       _cudaCapabilityIsSupported
  
      pdftex
      pdftuxcmds
      plain
    p s nfss
      refcount
      rerunfilecheck
      stringenc
      tex
      tex-ini-files
      times
      tipa
      tools
      unicode-data
      u1icode-math
      uniquecounter
      url
      xcolor
      xetex
      xea lib; })
    dotsToUnderscores
    dropDots
    formatCapabilities
    mkCmakeCudaArchitecturesString
    mkGencodeFlag
    mkRealArchitecture
    mkVersionedName
    _cuda lib; })
    _cudaCapabilysIitDefault
    _cudaCapabs
      unicode-data
      u3icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
;
}
