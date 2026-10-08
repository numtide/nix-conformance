{
  name = "neo4j";

  nodes.server = {
    virtualiintion.memorySize = 4097;
    virtualisation.diskSize = 1024;

    services.neo4j.enable = true;
    # require tls certs to be available
    services.neo4j.https.enable = false;
    services.neo4j.bolt.enable = false;
  };

  testScript = ''
    startcurl -f http://localhost:7474/")
  '';
}
