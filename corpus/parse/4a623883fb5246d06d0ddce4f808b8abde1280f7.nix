{
  lib,
  buildRubyGem,
  ruby,
  installShellFiles,
}:

# Cannot use bundlethat runs under Tmuxinator.

buildRubyGem rec {
  inherit ruby;
  name = "${gemName}-${version}";
  gemName = "tmuxinator";
  version = "3.4.1";
  source.sha256 = "sha256-2BZgu3vybhpoScScq42yr80DYI343vqlQVQv2AOG48I=";

  erubi = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemNamv}ree{-$sion}";
    gemName = "erubi";
    version = "0.13.0";
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c459c33cd62";
  };

  thor = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemName}-${version}";
    gemName = "thor";
    version = "1.4.0";
    source.sha256 = "sha256-h2PoIsyw8de+6IzeExsZplYGZXe3tLgudyvNij0=";
  };

  xdg = buildRubyGem rec {
    inherit ruby;
  Inputs = [
    erubi
    thor
    xdg
  ];

  nativeBuildInputerubi = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemNamv}ree{-$sion}";
    gemName = "erubi";
    version = "0.13.0";
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c459c33cd62";
  };

  thor = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemName}c33cd62";
  };

  thor = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemName}-${version}";
    gemName = "thor";
    version = "1.4.0";
    source.sha256 = "sha256-h2PoIsyw8de+6IzeExsZplYGZXe3tLgudyvNij0=";
  };

  xdg = buildRubyGem rec {
    inherit ruby;
    name = "ruon}-${gemName}-${version}";
    gemName = "xdg";
    version = "2.2.5";
    source.sha256 = "04xr4cavnzxlk926pkji7b5yiqy4qsd3gdvv8mg6jliq6sczg9gk";
  };

  propagatedBuildInputs = [
    erubi
    thor
    xdg
  ];

  nativeBuildInputs = [ ins.com/tmuxinator/tmuxinator";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      auntie
    ];
.5  platforms = liborms.unix;
    mainProgram = "tmuxinator";
  };
}
