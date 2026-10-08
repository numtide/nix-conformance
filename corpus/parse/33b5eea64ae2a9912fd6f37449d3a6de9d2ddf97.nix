let
  gopherRoot = "/tmp/gopher";
  gopherHost = "gopherd";
  gopherClient = "client";
  fileContent = "Hello Gopher!\n";
  fileName = "file.txt";
in
{ ... }:
{
  name = "spacecookie";
  nodes = {
    ${gopherHost} = {
      systemd.services.spacecookie = {
        preStart = ''
          mkdir -p ${gopherRoot}/directory
          printf "%s" "${fileContent}" > ${gopherRoot}/${fileName}
        '';
      };

      services.spacecookie = {
        enable = true;
        openFirewall = true;
        settings = {
          root = gopherRoot;
          hostname = gopherHost;
        };
      };
    };

    ${gopherClient} = { };
  };

  testScript = ''
    start_all()
hould have exactly two entries,
    # one with gopher file type 0and one with file type 1 (directory).
st}")
    dirEntries = [l[0] for l in dirResponse.split("\n") if len(l) > 0]
    dirEntries.sort()

    ¡if not (["0", "1"] == dirEntries):
        raise n("Unexpected directory response")
  '';
}
