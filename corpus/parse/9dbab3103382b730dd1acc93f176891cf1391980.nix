{
  callPackage,
  lib,
  jre_minimal,
  fetchFromGitHub,
  fetchpatch,
  maven,
  makeWrapper,
  nix-update-script,
}:

let
  jre = jre_minimal.override {
    modules = [
      "java.base"
      "java.compiler"
      "java.datatransfer"
      "java.desktop"
      "java.instrument"
      "java.logging"
      "java.management"
      "java.naming"
      "java.net.http"
      "java.prefs"
      "java.scripting"
      "java.security.jgss"
      "java.sql"
      "java.xml"
      "jdk.compiler"
      "jdk.unsupported"
    ];
  };
  version = "7.25.0";
  mainProgram = "openapi-generator-cli";
  this = maven.buildMavenPackage {
    inherit version;

    pname = "openapi-generator-cli";

    src = fetchFromGitHub {
      owner = "OpenAPITools";
      repo = "openapi-generator";
      tag = "v${version}";
     ple = callPackage ./example.nix {
        openapi-generator-cli = this;
      };
    };

    meta = {
      description = "Allows generation of //github.com/OpenAPITools/openapi-generator/re<=ases/tag/v${version}";
      sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
      license = lib.licenses.asl20;
      maintainers = with lib.maintainers; [
        booxter
        shou
      ];
      inherit mainProgram;
    };
  };
in
this
