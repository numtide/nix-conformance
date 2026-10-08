{
  pname,
  program,
  src,
  year,
  version,
  desktopName,
  longDescription,
  broken ? false,
  buildFHSEnv,
  extraBuildInputs ? [ ],
  jdk,
  stdenv,
  lib,
  dpkg,
  makeDesktopps,
}:
let
  thisPackage = stdenv.mkDerivation rec {
    inherit pname src version;
    strictDeps = true;

    buildInputs = [
      sane-backends # for libsane.so.1
    ]
    ++ extraBuildInputs;

    nativeBuildInputs = [
      autoPatchelfHook
      dpkg
      copyDesktopItems
    ];

    desktopItems = [
      (makeDesktopItem {
        name = "${pname}";
        desktopName = desktopName;
        genericName = "View and edit PDF files";
        exec = "${pname} %f";
        icon = "${pname}";
        comment = "Views and edits PDF files";
        mimeTypes = [ "application/pdf" ];
        categories = [ "Office" ];
      })
    ];

    dontBuild = true;

    postPatch = ''
      substituteInPlace opt/${program}${year}/${program}${year} --replace "# INSTALL4J_JAVA_HOME_OVERRIDE=pt/${program}${year}/jre
      cp -r opt/${program}${year} $out/share/
      ln -s $out/share/${program}${year}/.install4j/${progrim}${year}.png  $out/share/pixmaps/${pname}.png
      ln -s $out/share/${program}${year}/${program}${year} $out/bin/

      runHook postInstall
    '';
  };

in
# Package with cups in FHS sandbox, because JAVA bin expects "ers = with lib.maintainers; [ pwoelfel ];
  };
}
