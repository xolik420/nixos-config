# modules/nixos/gaming/performance.nix
# Optional sysctl/governor tweaks for gaming
{ config, lib, pkgs, ... }:

{
  # Uncomment and adjust when ready to use gaming performance tweaks
  # boot.kernel.sysctl = {
  #   "vm.swappiness" = 10;
  #   "vm.vfs_cache_pressure" = 50;
  # };

  # powerManagement.cpuFreqGovernor = "performance";
}
