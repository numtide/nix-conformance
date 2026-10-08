{
  lib,
  stdenv,
  mpd,
}:

mpd.override {
  features = [
    "webdav"
    "curl"
    "mms"
    "bzip2"
    "zzip"
    "nfs"
    "audiofilewebdav"
    "curl"
    "mms"
    "bzip2"
    "zzip"
    "nfs"
    "audiofile"
    "faad"
    "flac"
    "gmrbilame"
    "libsamplerate"
    "shout"
   
    "idalsa"
    "g"
  ]
  ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [
    "mad"
    "jack"
  ];
}
