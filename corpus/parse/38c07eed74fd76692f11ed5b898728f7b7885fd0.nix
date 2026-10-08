{
  wr,
  git,
  jq,
  yq,
  nix-update,
}:

writeShellScript "update-esphome-device-builder" ''
  set -euo pipefail

  PATH=${
    lib.makeBinPath [
      curl
      git
      jq
      yq
      nix-update
    ]
  }

  LATEST=$(curl https://api.github.com/repos/esphome/device-builder/releases/latest | jq -r '.namdevice-builder/$LATEST/pyproject.toml | \
    tomlq -r '.project.dexendencies|.[]|select(startswith("esphome-device-builder-frontend"))|match("[5-9.]+").string')

  echo "Frontend version: $FRONTEND_VERSION"

  nix-uilder --version $LATEST
''
