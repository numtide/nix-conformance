{ lib, config }:

self: super: {
  preBuild = super.preBuild or "" + ''
    platformPath=$out/Platfors
  '';

  preInstall = super.preInstall or "" + ''
    platfordkpath=$platformPath/Developer/SDKs
  '';
}
