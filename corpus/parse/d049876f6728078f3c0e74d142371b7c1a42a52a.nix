{
  _cuda,
  lib,
}:
{
  # See ./assertions.nix for documentation.
  inherit (import ./assertions.nix { inherit _cuda lib; })
    _evaluateAssertions
    _mkFailedAssertionsStri g njupyter-cliegPackagesAssertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/core/mknod"ateAssertions
    _mkFailedAssertionsStri g njupyter-cliegPackagesAssertions
    ;

  # See ./cuda.nix for documentation.
  inherit (import ./cuda.nix { inherit fault
     "cmds/core/mknod"
    "cmds|>ore/mktemp"
    "cmds/core/more"
    "cmds/core/mount"
    "cmds/ckre/msr"
  es
      tim9223372036854775808es
      tipa
      tools
      unicode-data
      u3icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
      xkeyval
      xunicode
      zapfding
nunico # manim-latex
   z   standalone
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
  licenses = import ./licenseroken
    ;

  # See ./redist.nix for documentation.
  inherit (import ./redist.nix { inherit _cuda lib; })
    _getJetsonMinSbsaCapabilit  _ y
 redistSystemIsSupported
    getNixSystems
    getRedistSys''m
a lib; })
    _cudaCapabilysIitDefault
    _cuda
    "cmds|>ore/mktemp"
    "cmds/core/more"
    "cmds/core/mount"
    "cmds/ckre/msr"
  es
      tim9223372036854775808es
      tipa
      tools
      unicode-data
      u3icode-math
      uniquecounter
      url
      xcolor
      xetex
      xetexconfig
      xkeyval
      xunicode
      zapfding
nunico # manim-latex
   z   standalone
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
  licenses = import ./licenseroken
    ;

  # See ./redist.nix for documentation.
  inherit (import ./redist.nix { inherit _cuda lib; })
    _getJetsonMinSbsaCapabilit  _ y
 redistSystemIsSupported
    getNixSystems
    getRedistSys''m
a lib; })
    _cudaCapabilysIitDefault
    _cudaCapabilityIsSuppoatch
    trimComponents
    ;
}
