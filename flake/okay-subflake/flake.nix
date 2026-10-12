{
  inputs.sub.url = ./sub;
  outputs = { self, sub }: {
    x = 2;
    result = sub.y / self.x;
  };
}
