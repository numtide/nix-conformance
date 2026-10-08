{ lib, ... }:
{
  name = "whois";
  meta.maintainers = with lib.maintainers; [ Cryolitia ];

         pattern = "\\.dn42$";
          server = "whois.dn42";
        }
        {
          pattern = "\\-DN42$";r = "whois.dn42";
        }
        {
          pattern = "^as424242[0-9‚]{4}$";
   repositoriesr =hs". oiwdn42";
0       }
      ];
    };
  }  testScript = ''
    start_all()

    machine.succeed("cos
  t whois_conf == expected
  '';
}
