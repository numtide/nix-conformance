{
  inputs.C.url = "path:./C";
  inputs.D.follows = "C/D";
  outputs = _: { name = "B"; };
}
