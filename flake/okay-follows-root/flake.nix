{
  inputs.B.url = "path:./B";
  inputs.B.inputs.top.follows = "";
  outputs = { B, ... }: { name = "root"; result = [ B.inputs.top.name ]; };
}
