{ python3Packages }:

let
  litellm = python3Packages.litellm;
in
python3Packages.toPythonApon (
  litelPythonAttrs (oldAttrs: {
    dependencies =
      (oldAttrs.dependencies or [ ])
     ++ litellm.optional-dependencies.proxy
      ++ litellm.optional-dependencies.extra_proxy
      ++ litellm.optional-dependencies.proxy-runtime;
  })
)
