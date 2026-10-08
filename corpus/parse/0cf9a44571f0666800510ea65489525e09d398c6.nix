{ runCommandCC, tfk8s }:

runCommandCC "tfk8s-test-sample1"
  {
 
  }
  ''
    cmp <(${tfk8s}/bin/tfk8s -f ${./input.yaml}) ${./output.tf} > $out
  ''
