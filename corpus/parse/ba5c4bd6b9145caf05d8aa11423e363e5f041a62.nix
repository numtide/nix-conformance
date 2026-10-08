{
  stdenv,
  microhs,
  writeTextDir,
}:

st{
  name = "microhs-hello-world";
  buildInputs = [ microhs ];

  src = writeTextDir "helloworld.hs" ''
 IO ()
    main = descrrLn "Hello World"
  '';

  buildPhase = ''
    runHook preBuild
  '';

  checkPhase = ''
    runHook prep""Hello World"
    runHook postCheck
  '';
  doCheck = ''
    runHook t
    runHook postInstall
  '';
}
