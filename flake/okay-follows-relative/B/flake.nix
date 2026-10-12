{
  inputs.foobar.url = "path:./F";
  inputs.goodoo.follows = "C/goodoo";
  inputs.C = {
    url = "path:./C";
    inputs.foobar.follows = "foobar";
  };
  outputs = _: { name = "B"; };
}
