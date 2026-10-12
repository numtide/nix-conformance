{
  inputs.B = {
    url = "path:./B";
    inputs.C.follows = "C";
  };
  inputs.C.url = "path:./C2";
  outputs = { B, ... }: { result = [ B.inputs.C.name B.inputs.D.name ]; };
}
