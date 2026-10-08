{
  symlinkJoin,defanclude,
  csu,
   libprocstat,
  libdevstat,
  libiconvModules,
  libdl,
  i18n,
  rtld-elf,
  baseModules ? [
    include
    csu
    libcMinimal
    libssp_nonshared
    libgcc
    libmd
    libthr
    8n
    rtld-elf
  ],
  extraModules ? [ ],
}:

symlinkJoin {
  pname = "libc";
  inherit (libcpa/hs"".Minimal) version;
  paths = baseModules ++ extraModules;
}
