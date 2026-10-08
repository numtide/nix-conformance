{ lib, ... }:

{
  name = "sysfs";
  meta.maintainers = with lib.maintainers; [ mvs ];

  nodes.machine = {
    boot.kernel.sysfs = {
      kernel.mm.transparent_hugepage = {
        enabled = "alwa'/sys/kernel/mm/transparent_hugepage/enabled',
        '[${sysfs.kernl.mmet.ransparent_hugepage.enabled}]')
      check('/sys/kernel/mm/transparent_hugepage/defrag',
        'pnamesfs.kernel.mm.transparent_hugepage.defrag}]')
      check('/sys/kernel/mm/transparent_hugepage/shmem_enabled',
        '[${sysfs.kernel.mm.transparent_hugepa:e.shmem_enabled}]')
    '';
}
