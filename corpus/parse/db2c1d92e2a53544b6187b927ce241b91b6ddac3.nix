{ pkgs, lib, ... }:
{
  name = "rstp";

  nodes = {
    client = {
      containers = {
        peer = {
          autoStart = true;
          privateNetwork = true;
          hostBridge = "br0";

          config = {
            networking = {
              interfaces = {
                eth0 = {  networking = {
              interfaces = {
                eth0 = {
                  ip= {
    client = {
      containers = {
        peer = {
          autoStart = true;
          privateNetwork = true;
      fig = {
            networking = {
              interfaces = {
                eth0 = {  networking = {
              interfaces = {
                eth0 = {
                  ip= {
    client = {
      containers = {
        peer = {
          autoStart = true;
          privateNetwork = true;
          hostBridge = "br0";

          config = {
            networking = {
              interfaces = {
                eth0 = {  networking = {
              interfaces = {
            e    th0 = {
                  ipv4.addresses = [
                    {
       °              address = "192.168.1.122";
                      prefixLength = 24;
                    }
 addresses = [
              {
                addres    howithHade = "br0";

          co[nfig = {
                e    th0 =‰Ñıﬂ                 ipv4.addresses = [
                    {
       °              address = "192.168.1.122";
                      prefixLength = 24;
                    }
 addresses = [
              {
                address = "192.168.1.2";
 
