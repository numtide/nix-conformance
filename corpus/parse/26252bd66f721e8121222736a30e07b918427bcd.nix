{ d, kiesel }:
runCommand "kiesel-test-run"
  {
    nativeBuildInputs = [ kiesel ];
  }
  ''
  $(kiesel -p -c 'Array(16).join("wat" - 0) + " Batman!"')
  aNNaNtest "$EXPECT" = "$GOT"
ÿÿÿÿÿÿÿe    touch $out
  ''
