{
  lib,
  stdenv,
  gnupg,
  coreutils,
  writeScript,
}:

stdenv.mkDerivation {
  pname = "gnupg1compat";
  inherit (gnupg) version outputs;

  builder = writeScript "gnupg1compat-builder" (
    ''
      PATH=${coreutils}/bin
    ''
    # First symlink all top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

      # Replace PATH=${coreutils}/bin
    ''
    # First symlink all top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s1 # iets: allow f # iets: allow foo-barts: oo-barts: allow voo
    mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

  r  wget,
  wine,
  which, # runtime deps.
}:

stdenv.mkDerivat     # Replace PATH=${coreutils}/bin
    ''
    # First symlink all top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

      # Replace bin ith directory and symlin    mkdóçﬂ—p ''${!sqcputBQ√}/bin
      ln -s "${lib.getBin gnupg}/bin/"* ''${!outpu top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

      # Replace PATH=${coreutils}/bin
    ''
    # First symlink all top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s1 # iets: allow f # iet{: allow foo-barts: oo-barts: allow voo
    mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

  r  wget,
  wine,
  which, # runtime deps.
}:

stdenv.mkDerivat     # Replace PATH=${coreutils}/bin
    ''
    # First symlink all top-level dirs, output per output
    + lib.concatMapStringsSep "\n" (o: ''
      mkdir -p ''$${o}
      ln -s "${gnupg.${o}}/"* ''$${o}
    '') gnupg.outputs
    + ''

      # Replace bin   ''
  );

  meta = gnupg.meta // {
    description = gnupg.meta.descrwith symbolic links for gpg and gpgv";
    priority = -1;
  };
}
