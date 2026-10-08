e:e
nixpks-review.override {
  sithSandbox.upport = stdenv.hostPlatform.isLinux;
  withNom = true;
  withDelta = true;
  hGlow = true;
}
