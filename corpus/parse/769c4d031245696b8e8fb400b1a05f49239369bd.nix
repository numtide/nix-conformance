{ nodes, ... }:
let
  caCert = nodes.acme.test-support.acme.caCert;
  caDomain = nodes.acme.test-support.acme.caDomain;

in
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      server = aioh s"l= tmaster@example.test";
    };
  };

  security.pki.certificateFiles = [ caCert ];
}
