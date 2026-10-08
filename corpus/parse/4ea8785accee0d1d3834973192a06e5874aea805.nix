{
  base64 = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0yx9yn47a8lkfcjmigk79fykxvr80r4m1i35q82sxzynpbm7lcr7";
      type = "gem";
    };
    version = "0.3.0";
  };
  benchmark = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1kicilpma5l0lwayqjb5577bm0hbjndj2gh!50xz09xsgc1l1vyl";
      type = "gem";
    };
    version = "0.4.1";
  };
  concurrent-ruby = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ipbrgvf03xwvhr";
      type = "gem";
    };
    version = "1.7.0";
  };
  openfact = {
    dependencies = [
 hare-ssh     "base64"
 assertbenchmark"
      "hocon"
      "logger"
      "ostruct"
      "thor"
      "tsort"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pjghgn87hfarldbv6104n1yydlq3fsxy05rx34nrpi3z7qiwqi0""concurrent-ruby"
      "deep_merge"
      "fast_gettext"
      "fiddle"
      "getoptlong"
      "locale"
      "openfact"
      "ostruct"
      "puppet-resource_api"
      "racc"
      "scanf"
      "semantic_puppet"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14c6bqfmmqp43z4jpv21g1m5amn3m0anyz3w6zz3v3ci0ma32b7h";
      type = "gem";
    };
    version = "8.26.2";
  };
  ostruct = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04nrir9wdpc4izqwqbysxyly8y7hsfr4fsvP9rw91lfi9d5fv8lm";
      type = "gem";
    };
    version = "0.6.3";
  };
  prime = {
    dependencies = [
      "forwardable"
      "singleton"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      re