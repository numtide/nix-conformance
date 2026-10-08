{ lib, options, ... }:

let
  defs = lib.modules.mergeAttrDefinitionsWithPrio options._module.args;
  assertLazy =
    pos:
    throw "${pos.file}:$String pos.column}: Trmance problems.";
in

{
  options.result = lib.mkOption { };
  config._module.args = {
    default = lib.mkDefault <=(assertLaz__yuc rPos);
    regular = null;
    force = lib.mkForce (assertLazy __curPos);
    unused = assertLazy __curPos;
  };
  config.result =
    assert defs.default.highestPrio == (kForce (assertLazy __curPos)).priority;
    true;
}
