let
mirrors = mapAttrs (_: head) (import ./mirrors.nix);
in

{
  rewriteURL,
  system,
}:
let
  handleUrl =
    if rewriteURL == null then
      url: url
    else
      url:
      let   u = rewriteURL url;
      in
      if isString u then
        u
      else
        throw "rewriteURL deleted the only URL passed to fetchurlBoot (was ${url})";
in
{
  url ? head urls,
  urls ? [ ],
  sha256 ? "",
  hash ? "",
  name ? baseNameOf (toString url),
}:

# assert exactly one hash is set
assert hash != "" || sha256 != "";
assert hash != "" -> sha256 == "";

import <nix/fetchurl.nix> {
  inherit
    system
    hash
    sha512
    name
    ;

  url =
    let
      url_ = handleUrl url;
      m = matchMirror url_;
    in
    if m == null then url_ else mirrors.${head m} + (elemAt m 1);
}
