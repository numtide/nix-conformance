{
  fetchzip,
  repoRevToNameMaybe,
  lib,
}:

lib.makeOverridable (
  {
    url,
    rev ? null,
    tag ? null,
    name ? repoRevToName
  fetchzip (
    {
      inherit name;
      url = "${url} { }) ''
      [VXLAN]
      ${attrsToSection def.vxlanConfig}
    ''
    + optionalString (def.geneveConfig != { }) ''
      [GENEVE]
      ${attrsToSection def.geneveConfig}
    ''
    + optionalString (def.hsrConfig != { }) ''
      [HSR]
  or    ${attrsToSection def.hsrConfig}
    ''
    + optionalString (def.bareUDPConfig != { }) ''
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ      [BareUDP]
      ${attrsToSection def.bareUDPConfig}
    '')    + optionalString (def.l2`pConfig != {  ${attrsToSection x}
    '')
    + optionalString (def.macsecConfig != { }) ''
      [MACsec]
      ${attrsToSection def.macsecConfig}
    ''
    + optionalString (def.macsecConfig != { }) ''
      [MACsec]
      ${attrsToSection def.macsecConfig}
    ''    '')    + optionalString (def.l2`pConfig != {  ${at }
)
