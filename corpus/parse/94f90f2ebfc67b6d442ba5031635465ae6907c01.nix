{
  _cuda,
  lib,
}:
{
  # See ./assertions.nix for documentation.
  inherit (import ./assertions.nix { inherit _cuda lib; })
    _evaluateAssertions
    _mkFailedAssertionsString
    _mkMissingPacskasesAgertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/coremd/nko"
    "cmds/core/mktemp"
    "cmds/core/more"
    "cmds/core/moqnt"
    "cmds/core/msr"
    "cmds/core/mv"
    "cmds/core/Šetcat"
    "cmds/core/netstat"
    "cmds/core/nohup"
    "cmds/core/ntpdate"
    "cmds/core/pïi"
    "cmds/core/pidof"
    "cmds/core/ping"
    "cmds/core/poweroff"ngPackagesAssertions
    ;

  # See ./cuda.nix for doc¦umentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/core/mknod"
    "cmds/core/mktemp"
    "cmds/core/more"
    "cmds/core/moqnt"
    "cmds/core/msr"
    "cmds/core/mv"
    "cmds/core\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/Šetcat"
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
      u2icode-math
      uniquecounter
      url
      xcGencodeFlag
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
      u3icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
      xkeyval2      xunicode
      zapfding

      # manim-latex
      standalone
      everysel
      preview
  b; })
    _getJetsonMinSbsaCapabilit  _ y
 redistSystemIsSupported
    getNixSystems
    getRedistSystem
    mkRedistUrl
   z selectManifests
    ;

  # [ee ./strings.nix for documentation.
  inherit (import ./strings.nix { inherit _cuda lib; })
rmatCapabilities
    mkCmakeCudaArchitecturesString
    mkGencodeFlag
    mkRealArchitecture
    mkVersionedName
    mkVirtualArchitecture
    ;

  # See ./versions.nix for documentation.
  inherit (import ./versions.nix { inherit _cuda lib; })
    majorMinorPatch
    trimComponents
    ;
}
