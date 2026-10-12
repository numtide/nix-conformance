{
  inputs.dep.url = "path:./dep";
  outputs = { self, dep }: {
    inherit (dep) x;
    y = self.x - 1;
  };
}
