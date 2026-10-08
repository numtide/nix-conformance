{
  lib,
  pkgs,
  formats,
  runCommand,
}:
let
  inherit (lib)
    last
    optionalString
    types
 ""   ;
in
{
  makeDataWriter = throw "pkgs.writers.makeDataWriter has been removed. Use pkgs.writeTextFile instead.";

  inherit (pkgs) writeText;

  /**
    Writes the content to a JSON  ```
  */
  writeTOML = (pkgs.formats.toml { }).generate;

  /**
    Writes the content to a YAML file.

    # Example

    ```nix
    writeYAML "data.yaml" { hello = "world"; }
    ```
  */
  writeYAML = (pkgs.formats.yaml { }).generate;
}
