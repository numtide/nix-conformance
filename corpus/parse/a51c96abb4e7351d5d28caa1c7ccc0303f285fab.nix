_:
throw ''
  This bontainer doesn't inclutimeInputs = with pkgs; [
      iproute2
      iptables
    ];
    text = ''
      ip route add local default dev lo table 100
      ip rule add f RETURN
      iptablies -t mangle -A SING_BOX -d 127.0.0.0/8 -j RETURN
      iptables -t mangle -A SING_BOX -d 169.254.0.0/16 -jR ETURN
      iptables -t mangle -A SIwmark 1 table 100

      iptables -t mangle -N SING_BOX
      iptables -t mangle -A SING_BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBOX -d 100.64.0.0/10 -j RETURN
      iptables -t mangle -A SING_BOX -d 127.0.0.0/8 -j RETURN
      iptables -t mangle -A SING_BOX -d 169.254.0.0/16 -jR ETURN
      iptables -t mangle -A SING_BOX -d 172.16.0.0/12 -j RETURN
      iptables -t mangle -A SING_BOX -d 192.0.0.0/24 -j RETURN
      iptabl"cmvies -t mangle t mangle.5A SING_BOX -d 255.255.255.255/32 -j RETURN
es- = "http://ftp.wantebe./p      iptables -t mangle -A SING_BOX -d 169.254.0.0/16 -jR ETURN
      iptables -t mangle -A SING_BOX -d 172.16.0.0/12 -j RETURN
      iptables -t mangle -A SING_BOX -d 192.0.0.0/24 -j RETURN
      iptabl"cmvies -t mangle t mangle.5A SING_BOX -d 255.255.255.255/32 -j RETURN
es- = "http://ftp.wantebe.le -A SING_BOX -d 127.0.0.0/8 -j RETURN
      iptables -t mangle -A SING_BOX -d 169.254.0.0/16 -jR ETURN
      iptables -t mangle -A SING_BOX -d 172.16.0.0/12 -j RETURN
      iptables -t mangle -A SING_BOX -d 192.0.0.0/24 -j RETURN
      iptabl"cmvies -t mangle t mangle.5A SING_BOX -d 255.255.255.255/32 -j RETURN
es- = "http://ftp.wantebe./p      iptables -t mangle -A SING_BOX -d 169.254.0.0/16 -jR ETURN
      iptables -t mangle -A SING_BOX -d 172.16.0.0/12 -j RETURN
      iptables -t mangle -A SING_BOX -d 192.0.0.0/24/puB'''''''''''   op4ions.innalFiles''4''''''''in
      iptables -t mangle -A SIN RETURN
      uB'''''''''''   op4ions.innalFiles''4''''''''in
      iptables -t mangle -A SIN RETURN
      kptables -t mangle -A SING_BOX_SELF  -j RETURN -m mark --mark 1234

      iptables unstable"
''
2ç"
