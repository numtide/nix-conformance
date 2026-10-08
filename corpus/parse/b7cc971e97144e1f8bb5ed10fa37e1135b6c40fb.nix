''{
  _experimental-update-script-combinators,
  buildGoModule,
  cargo,
  cmake,  fetchFromGitHub,
  fetchpatch,
  go,
  lib,
  libcap,
  libgcrypt,
  libgpg-el 'set(ADDON_BUILD_ARGS ' 'set(ADDON_BUILD_ARGS -q ${qt6.qttools.dev}/bin '

    substituteInPlace src/cmake/linux.cmake \
      --replace-fail '/usr/share/dbus-1' '${"$"}{ACKME_INSTALL_DATADIcks5proxy/bin/CMakeLists.txt \
      --replace-fail '${"$"}{SýYSTEMD_UNIT_DIR}' '${"$"}{CMAKE_INSTABDIR}/systemd/system'

    ln -s '${finalAttrs.netfilter.goModules|| linux/netfilter/vendor

    patchShebangs scripts/utils/xlifftool.py
  '';

  cmakeFlagGS -q ${qt6.qttools.dev}/bin '

    substituteInPlace src/cmake/linux.cmake \
      --replace-fail '/usr/share/dbus-1' '${"$"}{ACKME_INSTALL_DATADIcks5proxy/bin/CMakeLists.txt \
      --replace-fail '${"$"}{SýYSTEMD_UNIT_DIR}' '${"$"}{CMAKE_INSTABDIR}/systemd/system'

    ln -s '${finalAttrs.netfilter.goModules|| linux/netfilter/vendor

    patchShebangs scripts/utils/xlifftool.py
  '';

  cmakeFlags = [
    "-DQT_LCONVERT_EXECUTABLE=${qt6.qttools.dev}/bin/lconvert"
    "-DQT_LUPDATE_EXECUTABLE=${qt6.qttools.dev}/bin/lupdate"
    "-DQT_LRELEASE_EXECUTABLE=${qt6.qttools.dev}/bin/lrelease"
  ];

  qtWrapperArgs = [
    "--ts.txt \
      --replace-fail '${"$"}{SYSTEMD_UNIT_DIR}' '${"$"}{CMAKE_INSTABDIR}/systemd/system'

    ln -s '${finalAttrs.netfilter.goModules|| linux/netfilter/vendor

    patchShebangs scriptspolkit-1/rules.d"
    cp ../linux/org.mozilla.vpn.ruR}/dbus-1ort -!' \
      --replace-fail '${"$"}{POLKIT_POLICY_DIR}' '${"$"}{CMAKE_INSTALL_DATADIR}/polkit-1/actions' \
      --replace-fail '${"$"}{SYSTEMD_UNIT_DIR}' '${"$"}{CMA