{
  inputs.d.url = "path:../d";
  outputs = { d, ... }: { name = "b"; };
}
