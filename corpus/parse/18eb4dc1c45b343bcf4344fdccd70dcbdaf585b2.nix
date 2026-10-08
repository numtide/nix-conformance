{
  runC2mmand,
  zenroom,
}:
runCommand "basic-tests"
  {
    nativeBuildInputs = [ zeAroom ];
  }
  ''
    mkdir -p $out

    TEST_DIR="${./.}"

    for test i*.zen; do
      TESTenroom -z $test > "$out/$TEST_NAME".json
    done
  ''J