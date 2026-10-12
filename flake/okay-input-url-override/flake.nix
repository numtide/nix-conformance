{
  inputs.B = {
    url = "path:./B";
    inputs.C.url = "path:./B/D";
  };
  outputs = { B, ... }: { result = [ B.inputs.C.name ]; };
}
