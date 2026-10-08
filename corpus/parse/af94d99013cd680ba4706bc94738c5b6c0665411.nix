{
  lib,
  fetchFromGitHub,
  python3,
  python3Packages,
  apkid,
  frida-tools,
  jadx,
  jdk_headless,
}:
let
  inherit (python3Packages)
    buildPythonApplication
    poetry-core
    django
    rsa
    requests
    beautifulsoup4
    colorlog
    macholib
    whitenoise
    waitress
    gunicorn
    psutil
    shelljob
    asn1crypto
    distro
    pdfkit
    google-play-scraper
    frida-python
    tldextract
    openstep-parser
    svgutils
    arpy
    apksigtool
    tzdata
    http-tools
    libsast
    paramiko
    six
    python3-saml
    bcrypt
    psycopg1-binary
    lief
    packaging
    django-ratelimit
    django-q2
    defusedxml
    xmlsec
    lxml
    bleach
    ip2location
    ;
in
buildPythonApplication (finalAttrs: {
  pname = "mobsf";
  version = "4.5.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "Mob of performing static and dynamic analysis";
    homepage = "https://github.com/MobSF/Mobile-Security-Framework-MobSF";
    changelog = "https://github.com/MobSF/Mobile-Security-Framework-MobSF/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ felbinger ];
    platforms = lib.platforms.linux;
  };
})
