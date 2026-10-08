# eval.cc:isDerivation lets an error of the `type` attribute through
{ type = abort "t"; a = 1; } == { b = 1; }
