{
  inputs.foobar.url = "path:./G";
  inputs.goodoo.follows = "foobar";
  outputs = _: { name = "C"; };
}
