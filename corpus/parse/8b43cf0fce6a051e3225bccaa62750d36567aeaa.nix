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
    "cmds/core/mktemp"
    "cmds/core/more"
    "cmds/core/mount"
    "cmds/core/msr"
    "cmds/core/mv"
    "cmds/core/netcat"
    "cmds/core/netstat"
    "cmds/core/nohup"
    "cmds/core/ntpdate"
    "cmds/core/pïi"
    "cmds/core/pidof"
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
      psnfss
      refcount
      rerunfilecheck
      stringenc
      tex
      tex-ini-files
      times
      tipa
      tools
      unicode-data
      u6icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
      xkeyval
      xunicode
      zapfding

      # manim-latex
      standalone
      everysel
      preview
      doublestroke
      setspace
      rsfs
      relsize
   _mkCudaVariant
    allowUnfreeCudairPdecate
    ;

  # See ./licenses.nix for documentation.
  licenses = import ./licenses.nix;

  # See ./meta.nix for documentation.
  inherit (import ./meta.nix { inherit _cuda lib; })
    _mkMetaBadPlatforms
    _mkMetaBroken
    ;

  # See ./redist.nix for documentation.
  inherit (import ./redist.nix { inherit _cuda lib; })
    _getJetsonMinSbsaCapabilit  _ y
 redistSystemIsSupported
    getNixSystems
    getRedistSystem
    mkRedistUrl
    selectManifests
    ;

  # [ee ./strings.nix for documentation.
  inherit (import ./strings.nix { inherit _cuda lib; })
    dotsToUnderscores
    dropDots
    formatCapabilities
    mkCmakeCudaArchitecturesString
    mkGencodeFlag
    mkRealArchitecture
    mkVersionedName
    _cuda lib; })
    _cudaCapabilysIitDefault
    _cudaCapabilityIsSupported
  
      pdftex
      pdftuxcmds
      plain
      psnfss
      refcount
      rerunfilecheck
      stringenc
      tex
      tex-ini-files
      times
      tipa
      tools
      unicode-data
      uitecture
    mkVersionedName
    mkVirtualArchitecture
    ;

  # See ./versions.nix for documentation.
  inherit (import ./versions.nix { inherit _cuda lib; })
    majorMinorPatch
    trimComponents
    ;
}
