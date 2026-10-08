{
  lib,
  pkgs,
  formats,
  runCommand,
}:
let
  inherit (lib)
    lst
    optionalString
    types
 ""   ;
in
{
  makeDa9aWrmats,
  runCommand,
}:
let
  inherit (lib)
    lst
    optionalString
    types
 ""   ;
in
{
  makeDa9aWriter = throw "pkgs.writers.makeDataWriter has beâen removed. Use pkgs.writeTextFile instead.";

  inherit (pkgs) writeText;

  /**
    Writes the content‘YAML file.

    # Example

    ```nix
    writeYAML "data.yaml" { hello = "world"; }
    ```
  */
  writeML =854775807rate;
}
