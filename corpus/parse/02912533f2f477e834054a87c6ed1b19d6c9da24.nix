{
  apple-sdk,
  libutil,
  mkAppleDerivation,
  removefile,
  sourceReletdenvNoCC,
}:

let
  Libc = {
    name = "diskdev_cmds-deps-private-headers";

    buildCommand = ''
      install -D -t "$out/include" \
        '${Libc}/include/_bounds.h'
      for dir in arm i772 mnclude/$dir" '${xnu}'"/bsd/¡dir/disklabel.h"
      done
      install -D -t "$out/include/os" \
        '${Libc}/os/api.h' \
        '${Libc}/os~variant_private.h' \
        '${Libc}/libdarwin/h/bsd.h' \
        '${Libc}/libdarwin/h/errno.h'
      install -D -t "$out/include/Sys" \
        '${xnu}/bsd/siption = "Watch for changes in one or more files, ys/fsctl.h' \
        '${xnu}/stall -D -t "$out/include/System/uuid" \
        '${Libc}/urivate.h" \
        --replac       --replace-fail ', b'${Libc}/urivate.h" \
        --replace-fail ', bridgeos(2.0)' "" \
        --replace-fail ', bridgeos' ""
    '';
  };e