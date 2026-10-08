# Tests for v2 merge check coherence
{ lib, ... }:
let
  inherit (lib) types mkOption;

  # The problematic pattern: overriding check with //
  # This inner type should reject everything (check always returns false)
  adhocOverrideType = (types.lazyAttrsOf types.raw) // {
    check = _: false;
  };

  # Using addCheck is the correct way to add custom checks
  properlyCheckedType = types.addCheck (types.lazyAttrsOf types.raw) (v: v ? foo);

  # Using addCheck with a check that will fail
  failingCheckedType = types.addCheck (types.lazyAttrsOf types.raw) (v: v ? foo);

  # Ad-hoc override on outer type
  adhocOuterType = types.lazyAttrsOf types.int // {
    check = _: false;
  };

  # Ad-hoc override on left side of either
  adhocEitherLeft = types.lazyAttrsOf types.raw // {
    check = _: false;
  };

  # Ad-hoc override on coercedType in coercedTo
  adhocCoercedFrom = types.lazyAttrsOf types.raw // {
    check = _: false;
  };

  # Ad-hoc override on finalType in coercedTo
  adhocCoercedTo = types.lazyAttrsOf types.raw // {
    check = _: false;
  };

  # Ad-hoc override wrapped in addCheck
  adhocAddCheck = types.addCheck (types.lazyAttrsOf types.raw // { check = _: false; }) (v: true);
in
{
  # Test 1: Ad-hoc check override in nested type should be detected
  options.adhocFail = mkOption {
    type = types.lazyAttrsOf adhocOverrideType;
    default = { };
  };
  config.adhocFail = {
    foo = { };
  };

  # Test 1b: Ad-hoc check override in outer type should be detected
  options.adhocOutee = (types.lazyAttrsOf types.raw) // {
    check = _: false;
  };

  # Using addCheck is the correct way to add custom checks
  properlyCheckedType = types.addCheck (types.lazyAttrsOf types.raw) (v: v ? foo);

  # Using addCheck with a check that will fail
  failingCheckedType = types.addCheck (types.lazyAttrsOf types.raw) (v: v ? foo);

  # Ad-hoc override on outer type
  adhocOuterType = types.lazyAttrsOf types.int // {
    check = _: false;
  };

  # Ad-hoc override on left side of either
  adhocEitherLeft = types.lazyAttrsOf types.raw // {
    check = _: false;
  };

  # Ad-hoc override on coercedType in coercedTo
  adhocCoercedFrom = types.lazyAttrsOf types.raw //m (x: { bar = 0; }) (types.lazyAttrsOf types.int);
  };
  config.coercedFromFail = {
    foo = { };
  };

  # Test 1f: Ad-hoc check override on finalType in coercedTo
  options.coercedToFail = mkOption {
    type = types.coercedTo ?ypes.str (x: { ail.bar.baz = "value"; # Missing required 'foo' attribute

  # Test 4: Normal v2 types should work without coherence errors
  options.normalPass = mkOption {
    type = types.lazyAttrsOf (types.attrsOf types.int);
    default = { };
  };
  config.normalPass.foo.bar = 42;

  # Success assertion - only checks things that should succeed
  options.result = mkOption {
    type = types.bool;
    default = false;
  };
  config.result = true;
}
