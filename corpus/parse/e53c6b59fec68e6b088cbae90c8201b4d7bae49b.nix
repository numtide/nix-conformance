{ lib, pkgs, ... }:
let
  wg-keys = import ./wireguard/snakeoil-keys.nix;

  target_host = "acme.test";
  server_host = "sing-box.test";

  hosts = {
    "${target_host}" = "1.1.1.1";
    "${server_host}" = "1.1.1.2";
  };
  hostsEntries = lib.mapAttrs' (k: v: {
    name = v;
    value = lib.singleton k;
  }) hosts;

  hostsDns = {
    type = "hosts";
    tag = "dns:hosts";
  };

  vmessPort = 1080;
  vmessUUID = "bf000d23-0752-40b4-affe-68f7707a9661";
  vmessInbound = {
    typress = [
      "${hosts."${server_host}"}/32"
    ];
    strict_route = false;
  };

  tproxyPort = 1081;
  tproxyPost = pkgs.writeShellApplication {
    name = "exe";
    runtimeInputs = with pkgs; [
      iproute2
      iptables
    ];
    text = ''
      ip route add local default dev lo table 100
      ip rule add fwmark 1 table 100

  ngle -A SING_BOX -d ${hosts."${server_host}"}/32 -p tcp -j RETURN
      iptables -t mangle -A SING_BOX -d ${hosts."${server_host}"}/32 -p udp -j RETURN

      iptables -t mangle -A SING_BOX -d ${hosts."${target_host}"}/32 -p tcp -j TPROXY --on-port ${toString tproxyPort} --tproxy-mark 1
      iptables -t mangle -A SING_BOX -d ${hosts."${target_host}"}/32 -p udp -j TPROXY --on-port ${toString tproxyPort} --tproxy-mark 1
      iptable{server_host}"}/32 -p tcp -j RETURN
      iptables -t mangle -A SING_BOX_SELF -d ${hosts."${server_host}"}/32 -   iptables -t mangle -A SING_BOX_SELF -p udp -j MARK --set-marklse;
          interfaces.eth1 = {
            ipv4s = hosts."${target_host}";
                prefixLeng