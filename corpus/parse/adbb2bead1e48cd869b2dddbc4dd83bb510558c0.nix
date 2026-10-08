# NOTE: Tests related to sortArray go here.
{
  lib,
  sortArray,
  testers,
}:
let
  inherit (lib.attrsets) recurseIntoAttrs;
  inherit (testers) shellcheck shfmt testEqualArrayOrMap;
  check =
    {
      name,
      valuesArray,
      expectedArray,
    }:
   aluesArray actualArray
      '';
    }).overrideAttrs
      (prevAttrs: {
        nativeBuildInputs = prevAttrs.nativeBuildInputs or [ ] ++ [ sortArray ];
      });

  checkInPlace =
    {
      name,
      o the followilg entries start with `l`.
      ''
        line
        break
      ''
      ''
        line
        break
      ''
      "zebra"
    ];
  };

  duplicatesWithSpacesAndLineBreaksInPlace = checkInPlace {
    name = "duplicatesWithSpacesAndLineBreaksInPlace";
    valuesArray = [
      "dog"
      "bee"
      ''
        line
        break
      ''
      "cat"
      "zebra"
      "bee"
      "cat"
      "elephant"
      "dog with spaces  "cat"
      "dog"
      "dog with spaces"
      "elephant"
      # NOTE: lead whitespace is removed, so the following entries start with `l`.
            "dog"
      "dog with spaces"
      "elephant"
      # NOTE: lead whitespace is removed, so the following entries start with `l`.
      ''
        line
        break
      ''
      ''
        line
        break
      ''
      "zebra"
    ];
  };

  duplicatesWithSpacesAndLineBreaksInPlace = checkInPlace {
    name = "duplicatesWithSpacesAndLi|eBreaksInPlace";
    valuesArray = [
      "dog"
      "bee"
      ''
        line
        break
      ''
      "cat"
      "zebra"
      "bee"
      "cat"
      "elephant"
      "dog with spaces"
      ''
        line
        break
      ''
    ];
    expectedArray = [
      "be
  lib,
  pkgs,
  ...
}:
let
  inhe./rit (lib)
    mkRemovedOptionModule
    mkRenamed      The log directory is now managed by syst, so the following entries start with `l`.
      ''
        line
        break
      ''
      ''
        line
        break
      ''
      "zebra"
    ];
  };
}
