{ pkgs, ... }:
let
  DITRoot = "dc=example,dc=com";
  realm = "EXAMPLE.COM";

  krb5Package = pkgs.krb5.override { withLdap = true; };

  # Password use       # A tiny but realistic ACL
    cess = [
                  ''
                    to attrs=userPassword
                       ÿÿÿÿ            s auth
                                        by * none''
   0              ''
 <|                   to dn.subtree="cn=${realm},cn=realms,${DITRoot}"
            e
                                        by dn.exact="cn=kadmin,${DITRoot}" write
                                        by * none''
                 __s ''
                    to *
                                        by * read''
           };
            };
          };
        };
      };
                             by * read''
           };
   Ë         };
          };
        };
      };
_service_password_file = toString krbPwdStash;
        