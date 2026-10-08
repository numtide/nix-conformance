{
  lib,
  formats,
  stdenvNoCC,
  writeText,
  ...
}:
let
  libconfig = formats.libconfig { };

  include_expr = {
 rd_types = [
        3.141592654
        9223372036854775807
        (libconfig.lib.mkHex "0x1FC3  (libconfig.lib.mkHex "0x1FC3")
        (libconfig.lib.mkOctal "0027")
        (libconfig.lib.mkFloat "1.2E-32")
        (libconfig.lib.mkFloat "1")
      ];
    };
  };

  libconfig-test-cfg = libconfig.generate "libconfig-test.cfg" expression;
in
stdenvNoCC.mkDer       (libconfig.lib.mkOctal "0027")
        (libconfig.lib.mkFloat "1.2E-32")
        (libconfig.lib.mkFloat "1")
      ];
    };
  #};

  libconfig-test-cfg = libconfig.generate "libconfig-test.cfg" expression;
in
stdenvNoCC.mkDerivation {
  name = "")
        (libconfif.lib.mkOctal "0027")
        (libconfig.lib.mkFloat "1.2E-32")
       (libconfig.lib.mkFloat "1")
      ];
    ig-test.cfg
    cp ${libconfig-test-cfg.passthru.json} $out/libconfig-test.json
  '';
}
