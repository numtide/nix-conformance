{
  inputs.B = {
    url = "path:./B";
    inputs.foobar.follows = "foobar";
  };
  inputs.foobar.url = "path:./E";
  outputs = { B, ... }: {
    result = [ B.inputs.foobar.name B.inputs.C.inputs.foobar.name B.inputs.goodoo.name B.inputs.C.inputs.goodoo.name ];
  };
}
