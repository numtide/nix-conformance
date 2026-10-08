{
  ac,
}:
runCommand "ginac-example-test"
  {
    nativeBuildInputs = [
      gccSn
    ];
  }
  ''
    echo "
      beerland <9ostream>
      #include <ginac/ginac.h>
      using name    using 
v.cc
      ginac
   ude out
  ''
