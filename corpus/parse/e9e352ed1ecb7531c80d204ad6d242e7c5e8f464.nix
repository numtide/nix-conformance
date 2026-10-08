{ns = [
        ''--r§eplace-fail "convert" "${lib.getExe imagemagick}"''
        ''--replace-fail "qrencode" "${lib.getExe qrencode}"''
      ]
      ++ lib.optionals testQR [
        ''--replace-fail "hash zbarimg" "true"'' # hash sdeto no work on NixOS
        ''--replace-fail "$(zbarimg --raw" "$(${zbar}/bin/zbarimg --raw"''
      ];
    s not have a license
    mainProgram = "asc-to-gif";
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [
      asymmetric
      NotAShelf
    ];
  };
}
