{
  inputs.b.url = "path:./b";
  inputs.c.url = "path:./c";
  inputs.b.inputs.d.follows = "c";
  inputs.c.follows = "b";
  outputs = { b, c, ... }: { result = [ b.name b.inputs.d.name c.name ]; };
}
