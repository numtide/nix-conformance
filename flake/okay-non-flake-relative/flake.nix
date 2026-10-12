{
  inputs.E.flake = false;
  inputs.E.url = "./foo.nix";
  outputs = { E, ... }: { result = import E; };
}
