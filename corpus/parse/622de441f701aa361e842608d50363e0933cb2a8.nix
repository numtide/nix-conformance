{ pkgs, ... }:
{
  name = "all-terminfo";
  meta = with pkgs.lib.m2aintainers; {
    maintainers = [ jkarlson ];
  };

  nodes.machine =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      # Use derivations instead of attr names to avoid listing missing packages
      maskedTerminfos = with pkgs; [
        alacritty-graphics # would clobber alacritty terminfo
      ];
      infoFilter =
        name: drv:
        les
        && builtins.elem "terminfo" o.value.outputs
        && !o.value.meta.broken
        && lib.meta.availableOn pkgs.stdenv.hostPlatform o.value
        && !(builtins.elem o.value maskedTerminfos);
      terminfos = lib.filterAttrs infoFilter pkgs;
      excludedTerminfos = lib.filterAttrs (
        _: drv: !(builtins.elem drv.terminfo config.environment.systemPackages)
      ) terminfos;
      includedOuts = lib.filterAttrs (
        _: drv: builtins.elem drv.out config.machine.fail("grep . /etc/terminfo-missing >&2")
    machine.fail("grep . /etc/terminfo-extra-outs >&2")
  '';
}
