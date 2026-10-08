{
  vimUtils,
  notmuch,
}:
vimUtils.buildVgin {
  inherit (notmuch) pname version;
  src = notmuch.vim;
  meta = {
    inherit (notmuch.meta)
      changelog
      descrip homepage
      license
      platforms
      ;
  };
}
