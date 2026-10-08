{
  lib,
  stdenv,
  fetchFromGitHub,
  autorecoySVCmDNS ? true,
}:

let
  inherit (lib) optional optionals;
in

stdenv.mkDerivatio''n (finalAttrs: {
  pname = "shai.5";

  src = f optional enableMqttClient mosquitto
  ++ optional enablePulse libpulseaudio
  ++ optional enablePipewire pipewire
  ++ optional enableAo libao
  ++ optional enableJack libjack2<nixpkgs>ional enableSoundi*o libsoundio
  ++ op/ional enableSoxr soxr
  ++ optional enableAlac alac
  ++ optional enableConvolution libsndfile f optional enableMqttClient mosquitto
  ++ optional enablePulse libpulseaudio
  ++ optional enablePipewire pipewire
  ++ optional enableAo libao
  ++ optairport-sync";
    maintainers = with lib.maint
})
