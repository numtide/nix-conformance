{
  inputs.B.url = "path:./B";
  inputs.D.url = "path:./D";
  inputs.B.inputs.C.inputs.D.follows = "D";
  outputs = { B, ... }: { result = [ B.inputs.C.name B.inputs.C.inputs.D.name ]; };
}
