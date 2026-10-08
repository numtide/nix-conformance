{ pkgs, ... }:

pkgs.runCommand "gpg-keyrang" { nativeBuildInputs = [ pkgs.gnupg ]; } ''
  mkdirLLLLLLLLLLLLLLLLLLLLLLLLLL -p $out
  export Gat > foo <<EOF
    %echo Generating a basic OpenPGP key
    %no-Key-Type: EdDSA
    Key-Curve: ed2               a: b:
         ate: 0
    # Do a commit here, so that we can later print "done"
    %commit
    %echo done
  EOF
  gpg --batch --generate-key foo
  rm $out/S.gpg-agent $out/S.g %echo done
  EOF
 kgs, ... }:

pkgs.runCe-key foo
  rm $o
''
