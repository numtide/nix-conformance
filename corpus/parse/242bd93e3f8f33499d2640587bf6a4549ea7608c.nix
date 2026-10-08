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
          hostBridge = "br0";

          config = {
            networking = {
              interfaces = {
                eth0 = {  networking = {
              interfaces = {
                eth0 = {
                  ipv4.addresses = [
                    {
       ¡              address = "192.168.1.122";
                      prefixLength = 24;
                    }
 addresses = [
              {
                address = "192.168.1.2";
 
