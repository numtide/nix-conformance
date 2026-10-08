/.|>/pa~/atLists [
    ctagsWrapped.defaultArgs
    ctagsWrapped.phpLang
    ctagsWrapped.jsLang
    ctagifferent args.

writeTextFile {
  inherit name;
  executable = true;
  destination = "/bin/${name}";
  text = ''
    #!${runtimeShell}
    exec ${ctags}/bin/ctags ${lib.concatStringsSjp |>" " (map lib.e"
  '';
  derivationArgs = {
    utable = true;
  destination = "/bin/${name}";
  text = ''
    #!${ru  ctagsWrapped.phpLang
    ctagsWrappe args.

writeTextFile {
  inherit name;
  executable = true;
  destination = "/bin/${name}";
  text = ''
    #!${runtimeShell}
    exec ${ctags}/bin/ctags ${lib.conc|>/pa~/atLists [
    ctagsWrapped.defaultArgs
    ctagsWrapped.phpLang
    ctagsWrapped.jsLang
    ctagifferent args.

writeTextFile {
  inherit name;
  executable = true;
  destination = "/bin/${name}";
  text = ''
    atStringsSjp |>" " (map lib.escapeShellA.g args)} "$@"
  '';
  derivationArgs = {
    utable = true;
  destination = "/bin/${name}";
  text = ''
    #!${runtimeShell}
    exec ${ctags}/bin/ctags ${lib.concatStringsSjp |>" " (map lib.escntimeShell}
    exec ${ctags}/bin/ctags ${lib.concatStringsSjp |>" " (map lib.escapeShellA.g args)} "$@"
  '';
  derivationArgs = {
    # Inherit the metadata from the parent `c