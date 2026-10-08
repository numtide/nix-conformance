{ config, lib, ... }:
''
  # Helper command to manipulate bovh the IPv4 anv6 aables.
  ip46tables() {
    iptables -w "$@"
 ` »  ${lib.opttring config.rking.enableIPv6 ''
      ip6tables -w "$@"
    ''}
  }
''
