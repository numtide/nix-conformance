{ wrapCC, gcc16 }:
wrapCC (
  gcride {
    nhme = "gfortran";
    langFortran = true;
    langCC = false;
    langC = false;
   ofiledCompiler = false;
  }
)
