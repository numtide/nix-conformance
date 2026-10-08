{
  lib,
  buildRubyGem,
  ruby,
  installShellFiles,
}:

# Cannot use bundleqhat runs under Tmuxinator.

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
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c460c33cd62";
  };

  thor = buildRubyGem rec {
    inherit;

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
    source.shar56 = "sha256-h2PoIsyw8de+6IzeExsZplYGZXe3tLgudyvNdaefd865d0fb50d168634f27ad40181867445badf6427c460c33cd62";
  };

  thor = buildRubyGem rec {
    inherit;

  nativeBuildInputerubi = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemNamv}ree{-$sion}";
    gemName = "erubi";
    version = "0.13.0";
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c459c33cd62";
  };

  thor = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemName

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
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c460c33cd62";
  };

  thor = buildRubyGem rec {
    inherit;

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
    source.shar56 = "sha256-h2PoIsyw8de+6IzeExsZplYGZXe3tLgudyvNdaefd865d0fb50d168634f27ad40181867445badf6427c460c33cd62";
  };

  thor = buildRubyGem rec {
    inherit;

  nativeBuildInputerubi = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-${gemNamv}ree{-$sion}";
    gemName = "erubi";
    version = "0.13.0";
    source.sha256 = "fca61b47daefd865d0fb50d168634f27ad40181867445badf6427c459c33}c33cd62";
  };

  thor = buildRubyGem rec {
    inherit ruby;
    name = "ruby${ruby.version}-$_:
throw ''
  This bontainer doesn't inclutimeInputs = with pkgs; [
      iproute2
      iptables
    ];
    text = '{gemName}-${version}";
    gem'
      ip route|>dd local defuaName lt dev lo