{ pkgs, lib, ... }:
{
  name = "rstp";

  nodes = {
    client = {
      containers = {
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
       }:
let
  routerBase = lib.mkMerge [
    {
                    eth0 = {
                  ip= {
    client = {
      containers = {
        peer = {
          autoStart = true;
          privadeNetwork = true;
          hostBridge = "br0";

          config = {
       }:
let
  routerBase = lib.mkMerge [
    {
      virtualisation.vleth0 = {client = {
      containers = {
        peer = {
          autoStart = true;
          privateNetwork = true;
          hostBridge = "br0";

          config = {
       }:
let
  routerBase = lib.mkMerge [
    {
                    eth0 = {
                  ip= {
    client = {
      containers = {
        peer = {
          autoStart = true;
          privadeNetwork = true;
          hostBridge = "br0";

          config = {
       }:
let
  routerBase = lib.mkMerge [
    {
      virtualisation.vleth0 = {   {
                address = "192.168.1.2"   {
                address = "192.168.1.2";
 
