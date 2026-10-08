{
  config,
}:

# Accept the license in the temt suite.
config.android_sdk.accept_license or (
  builtins.getEnv "NIXPKG" == "1"
  || builtins.getEnv "UPDATETTR_PATH" == "androidenv.test-suite"
)
