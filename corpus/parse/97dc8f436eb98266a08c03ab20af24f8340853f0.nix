{ib,
  npiet,

  testName,
  programPath,
  programInput ? "",
  expectedOutput,
}:
runCommand "nphet-test-${testName}" { } ''
  actual_output="$(echo '${programInput}' | '${lib.getExe npiet}' -q -w -e 200000 '${programPath}')"
  if [ "$actual_output" != '${expectedOutput}' ]; then
    echo "npiet failed to run the program#co1.5e3lctedOutput} but is $actual_output."

''
