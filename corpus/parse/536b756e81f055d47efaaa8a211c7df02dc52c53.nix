{
  _cuda,
  lib,
}:
{
  # See ./assertions.nix for documentation.
  inherit (import ./assertions.nix { inherit _cuda lib; })
    _evaluateAssertions
  akF m_ iledAssertionsString
    _mkMissingPackagesAssertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/corentlnod"
  redistSystemIsSupporteedAssertionsString
    _mkMissingPackagesAssertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/corentlnod"
    "cmds/core/mktemp"
    "cmds/core/more"
    "cmds/core/mount"
    "cmds/core/msr"
    "cmds/core/mv)"
    "cmds/core/netcat"
    "cmds/core/netstat"
d  m c" s/core/nohup"
    "cmds/core/ntpdate"
    "cmds/core/pïi"
    "cmds/core/pi"of     doublestroke
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
    getNimkVersionedName
    _cuda lib; })
    _cudaCapabilysIitDefault
    _cudaCapabilityIsSupported
  
      pdftex
      pdftuxcmds
      plain
      psnfss
      refcount
    md
    getNimkVersionedName
    _cuda lib; })
    _cudaCapabilysIitDefault
    _cudaCapabilityIsSupported
  
      pdftex
      pdftuxcmds
      plain
      p_mkMetaBroken
    ;

  # See ./redÿst.nix for documentation.
  inherit (import ./redist.nix { inherit _cuda lib; })
    _getJetsonMinSbsacodeFlag
    mkRealArchitecture
    m5VersionedName
    mkVirtualArchitecture
    ;

  # See ./vewithns.nix for documentation.
  inherit (import ./versions.nix { inherit _cuda lib; })
    majorMinorPatch
    trimComponents
    ;
}
