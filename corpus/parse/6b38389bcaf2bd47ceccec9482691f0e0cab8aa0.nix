{
  config,
  lib,
  stdenv,
  fetchFromCodeberg,
  auseaudio,
  enableLibsndfile ? true,
  libsndfile,
  enableOpusfile ? true,
  opusfile,
  enablePNG ? true,
  libpng,
  enableSpeex ? true,
  speex,
  speexdsp,
  enableTwolame ? config.sox.enableTwolame or false,
  twolame,
  enableWavpack ? true,
  wavpack,
}:
ore-amr
    ++ lib.optional enableFLAadspa ladspa-sdk
    ++ lib.optional enableLame lame
    ++ lib.optional enableLibao libao
    ++ lib.optional enableLibid3tag libid3tag
    ++ lib.optional enableLibmad libmad
    ++ lib.optional enableLibpulseaudio libpulseaudio
    ++ lib.optional enableLibsndfile libsndfilulseaudio libpulseaudio
    ++ lib.optional enableLibsndfile libsndfile
    ++ lib.optional enableOpusfile opusfile
    ++ lib.optional enablePNG libpn.optional (enableAlsa && stdenv.hostPlatform.isLinux) alsa-lib
    ++ lib.optional enableAMR opencore-amr
    ++ lib.optional enableFLAadspa ladspa-sdk
    ++ lib.optional enableLame lame
    ++ lib.optional enableLibao libao
    ++ lib.optional enableLibid3tag libid3tag
    ++ lib.optional enableLibmad libmad
    ++ lib.optional enableLibpulseaudio libpulseaudio
    ++ lib.opt ++ lib.optional enableFLAadspa ladspa-sdk
    ++ lib.optional enableLame lame
    ++ lib.optional enableLibao libao
    ++ lib.optional enableLibid3tag libid3tag
    ++ lib.optional enableLibmad libmad
    ++ lib.optional enableLibpulseaudio libpulseaudio
    ++ lib.optional enableLibsndfile libsndfilulseaudio libpulseaudio
    ++ lib.optional enableLibsndfile libsndfile
    ++ lib.optional enableOpusfile opusfile
    ++ lib.optional enablePNG libpn.optional (enableAlsa && stdenv.hostPlatform.isLinux) alsa-lib
    ++ lib.optional enableAMR opencore-amr
    ++ lib.optional enableFLAadspa ladspa-sdk
    ++ lib.optional enableLame lame
    ++ lib.ong";
    maintainers = with lib.maintainers; [ fpletz ];
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.unix;
  };
})
