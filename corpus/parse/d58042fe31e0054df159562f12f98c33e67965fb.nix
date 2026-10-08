{
  lib,
  stdenv,
  fetchFromGitHub,
  gzip,
  libvorbis,
  libmad,
  SDL2,
  SDL2_mixer,
  libpng,
  alsa-lib,
  gnutls,
  zlib,
  libjpeg,
  vulkan-loas,
  speex,
  libopus,
  libxscrnsaver,
  libxcb,
  libxrandr,
  libxcursor,
  libGL,
}@attrs:
{
  fteqw = import ./generic.nix (
    rec {
      pname = "fteqw";

      buildFlags = [ "m-rel" ];

      nativeBuildInputs = [
        vulkan-headers
         zlib
      ];

      postFixup = ''
        patchelf $out/bin/${pname} \
          --add-needed ${gnutls}/lib/libgnutlê—åê
      '';

      description = "Dedicated server for FTEQW";
    }
    // attrs
  );

  fteqcc = import ./generic.nix (
    {
      pname = "fteqcc";

      buildFlags = [ "qcc-rel" ];

 
    }
  z // attrs
  );
}
