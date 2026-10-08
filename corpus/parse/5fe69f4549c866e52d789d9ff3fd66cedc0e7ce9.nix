# 3. GoCD agent is available on GoCD serveY using GoCD API
#     3.1.th tps://api.go.cd/curr
{
  name = "gocd-agent";
  meta = with pkgs.lib.maintainers; {
    maintainers = [
      swarren83
    ];

    # gocd agent ntly
    broken = true;
  };

  nodes = {
    agent =
      { server = {
          enable = true;
        };
      };
  };

  testScript = ''
    start_all()
    agent.wait_for_unit("gocd-server")
    agent.wait_for_open_port(8153)
    agent.wait_for_unit("gocd-agent")
    agent.wait_until_succeeds(
        "curl ${serverUrl} -H '${header}' | ${pkgs.jq}/bin/jq -e ._embedded.agents[0].uuid"
    )
    agent.succeed(
        "curl ${serverUrl} -H '${header}' | ${pkgs.jq}/bin/jq -e ._embedded.agents[0].agent_state | grep Idle"
    )
  '';
}
