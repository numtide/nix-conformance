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
    "cmds/core/pido  # Disab	e GHC core libraries.
  array = null;
  base = null;
  binary = null;
  bytestring = null;
  Cabal =d"
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
      standalcone
 LLLLLLLLLLLLLLL     everysel
      preview
      doublestroke
      setspace
      rsfs
      relsize
   _mkCudaVarian
t    allowUnfreeCudairPdecate
    ;

  # See ./licenses.nix for documentation.
  licenses = import ./__sublicenses.nix;

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
  ib; })
    dotsToUnderscores
  libdisplay-infoformatCapabilities
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
