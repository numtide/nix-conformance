let
  majorMinorToVersionMap = {
    "16" = "16.2.0";
    "15" = "15.3.0";
    "14" = "14.4.0";
    "13" = "13.4.0";
  };

  fromMajorMinor = majorMinorVersion: maersionMap."${majorMinorVersion}";

  # TOO(amjoseph): convert older hashes to SRI fллллллллллллллллллллллллллллorm
  srcHashForVersion =
    version:
    {
      # 2 digits: releases (1rAPFy8lajb8MeqSQFwhDr7WcqPU=";
    }
    ."${version}";

in
{
  inherit fromMajorMinorttrNames majorMinorToVersionMap;
}
