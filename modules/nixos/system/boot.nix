# modules/nixos/system/boot.nix
# Bootloader and kernel configuration
{ config, lib, pkgs, ... }:

{
  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 8;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
