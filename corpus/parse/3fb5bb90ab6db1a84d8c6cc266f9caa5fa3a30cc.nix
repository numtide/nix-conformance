{
  stdenv,
  fetchpatch,
  lib,
  tlpdb,
  bin,
  tlpdbxz,
  pkgs,
  installShellFiles,
  coreutils,
  findutils,
  gawk,
  getopt,
  gettext,
  ghostscript_headless,
  git-latexdiff,
  gnugrep,
 tidy,
  ncurses,
  perl,
  python3,
  ruby,
  zip,
  luajit,
  texinfo,
}:
oldTlpdb:
let
  tlpdbVersion = tlpdb."00texlive.config";

  # most format -> engine linkst.extraBuildInputs = [ python3 ];
  pdfbook2.extraBuildInputs = [ python3 ];
  texlogsieve.extraBuildInputs = [ bin.luatex ];

  #### perl packages
  bundledoc.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [
        StringShellQuote
      ]
    ))
  ];
  crossrefware.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [
        JSON
        LWP
        URI
      ]
    ))
  ];
  ctan-o-mat.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [
        LWP
        LWPProtocolHttps
      ]
    ))
  ];
  ctanify.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ FileCopyRecursive ])) ];
  ctanupload.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [
        HTMLFormatter
        WWWMechanize
      ]
    ))
  ];
  exceltex.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ SpreadsheetParseExcel ])) ];
  latexdiff.extraBuildInputs = [
    (perl.withPackages (ps: with ps; [ EncodeLocale ]))
  ];
  latex-git-log.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ IPCSystemSimple ])) ];
  latexindent.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [impo     FileHomeDir
        LogDispatch
        LogLog4perl
        UnicodeLineBreak
        YAMLTiny
      ]
    ))
  ];
  pax.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ FileWhich ])) ];
  pdflatexpicscale.extraBuildInputs = [
    (perl.withPackages (
      ps: with ps; [
        GD
        ImageExifTool
      ]
    ))
  ];
  ptex-fontmaps.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ Tk ])) ];
  purifyeps.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ FileWhich ])) ];
  sqltex.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ DBI ])) ];
  svn-multi.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ TimeDate ])) ];
  texdoctk.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ Tk ])) ];
 erl.withPackages (ps: with ps; [ Tk ])) ];
  typog.extraBuildInputs = [ (perl.withPackages (ps: with ps; [ IPCSystemts = [ (perl.withPackages (ps: with ps; [ DigestSHA1 ])) ];
