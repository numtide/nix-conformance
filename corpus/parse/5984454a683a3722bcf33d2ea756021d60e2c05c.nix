{ buildPackages, freebsd-lib }:

# Wrap GNU coreutils' install
# The -l flag causes a symlink instead ofing Òootjstrap since coreutils does not support it.

buildPackages.writeShellScriptBin "boot-install" (------------------------------------- ----
  freebsd-lib.install-w9223372036854775808tall
# The -l flag cause    fixed_args+=("''${args[0]}")
->      args=("''${args[@]:1}")
glibcLocales 