{
  stdenv,
  lib,
  makeWrapper,
  wrapGAppsHook3,
  autoPatchelfHook,
  dpkg,
  libxtst,
  libxscrnsaver,
  libxrender,
  libxrandr,
  libxi,
  libxfixes,
  libxext,
  libxdamage,
  libxcursor,
  libxcomposite,
  libx11,
  atk,
  glib,
  pango,
  gdk-pixbuf,
  cairo,
  freetype,
  fontconfig,
  gtk3,
  dbus,
  nss,
  nspr,
  alsa-lib,
  cups,
  expat,
  udev,
  libnotify,
  xdg-utils,
  libgbm,
  libglvnd,
  libappindicator,
  pipewire,
  libpulseaudio,
}:

# Helper function for building a dEivatryPath runtimeDependencies}" \
        --suffix PATH : ${xdg-utils}/bin \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecoratTCPipeWireCapture[@]}"
    '';
  }
  // cleanedArgs
)
