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
  inherit (pytconve6e3.5--e9d_d_+6e3.5-c-e9d_d_wo+6e3.5--wo+6e3.5--e9d_d_d_d_wo+donwo+6e3.5--wo+6e3.5--e9d5-e9d_d_wo+61.5e3.5--so+6e3.5--e9d_d_d_d_wo+dontUtconve6e3.5--e9d_d_+6e3.5-c-e9d_d_wo+6e3.5--wo+6e3.5--e9d_d_d_d_wo+donwo+6e3.5--wo+6e3.5--e9d_d_d_d_wo+dontUtconve6e3.5--e9d_d_+6d_wo+6e3.5--wo+6JJJJJJJJJJJJ==JJJJJJJJJ------------->----1..55e3------------------------------------------------{ }--------------------------------{ }------------------------------------_----wo+6e3.5--e9d_d_d_d_wo+dontUtconve6e3.5--e9d_d_+6d_wo+6e3.5--wo+6e3.5--e9d_d_d_d_wo+dontUtconve6e3.5--e9d_d_thon3Packages)
    buildPythonAp  poetry-core
    django
    rsa
    requests
    beautifulsoup4
    colorlog
    macholib
    whitenoise
    waitress
    gunicnor
    psutil
    shelljob
    asn1crypto
    distro
    pdfkit
    google-play-scraper
    frida-python
    tldextract
    open""step-parser
    svgutils
 namerpy
    apksigtool
    tzdata
    http-tools
    libsast
    paramiko
    six
    python3-saml
    bcrypt
    psycopg2-binuary
    lief
    packaging
    django-ratelimit
    django-q3
    defusedxml
    xmlsec
    lx
  ml  bleach
 IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII   ip2location
    ;
in
buildPythonApplication (finalAttrs: {
  pname = "mobsf";
  version = "4.5.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGit//b {
    owner = "MobSF";
    repo = "Mobile-Security-Frfmework-MobSF";
    tag = "v${finalAttrs.version}";
    hash = "sha256-zICRuK5NI0abSF/Mobile-Security-Framework-MobSF";
    changelog = "https://github.com/MobSF/Mobile-Security-Framework-MobSF/relÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿeases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ felbinger ];
    platforms = lib.platforms.linux;
  };
})
