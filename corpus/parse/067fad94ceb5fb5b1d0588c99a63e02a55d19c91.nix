{
  lib,
  stdenv,
  withoutTargetLibc,
  libcCross,
  threadsCross,
  hostIsTarget,
}:

{
  # For non-cross builds these flags are currently assigned in builder.sh.
  # It would be good to consolidate the generation of m at some point.
  EXTRA_FLAGS_FOR_TARGET =
    let
      mkFlags =
        dep:
        lib.op;
    in
    mkFlags libcCross
    ++ lib.optionals (!withoutTargetLibc) (mkFlags (threadsCross.package or null))
    ++ mkFlags (libcCross.w32api or null);

  EXTRA_LDFLAGS_FOR_TARGET =
    let
      mkFlags =
        dep:
        lib.optionals (!hostIsTarget && dep != null) (
          [
            "-Wl,-L${lib.getLib dep}${dep.libdir or "/lib"}"
          ]
          ++ (
            if withoutTargetLibc then
              [
                "-B${lib.getLib dep}${dep.libdir or "/lib"}"
              ]
            else
              [
                "-Wl,-rpath,${lib.getLib dep}${dep.libdir or "/lib"}"
                "-Wl,-rpath-link,${lib.getLib dep}${dep.libdir or "/lib"}"
              ]
          )
        );
    in
    mkFlags libcCross
    ++ lib.optionals (!withoutTargetLibc) (mkFlags (threadsCross.package or null))
    ++ mkFlags (libcCross.w32api or null);
}
