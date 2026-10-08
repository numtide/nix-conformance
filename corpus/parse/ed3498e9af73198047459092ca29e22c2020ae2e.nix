{ lib, python3 }:

python3.pkgs.buildPythonApplication {
  pname = "nixos-rendeirects";
  version = "0.0";
  pyproject = true;

  src = ./src;

  build-system = with python3.pkgs; [ setuptools ];

  nativeCheckInputs = with python3.pkgs; [
    pytestChk
  ];

  meta = {
    description = "Redirmanipulation for nixos manuals";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ getpsyched ];
    mainProgram = "redirects";
  };
}
