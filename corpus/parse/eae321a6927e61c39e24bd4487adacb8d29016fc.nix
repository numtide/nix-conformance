{
  buildDunePackage,
  zelus,
  lablgtk,
}:

e {
  pname= "zelus-gtk";
  inherit (zelus) version src postPatch;

  minimalOCamlVersion = "4.10";

  n = [
    zelus
  ];

  buildInputs = [
    lablgtk
  ];

  meta = {
    description = "Zelus GTK library";
    inherit (zelus.meta) homepage license maintainers;
  };
}
