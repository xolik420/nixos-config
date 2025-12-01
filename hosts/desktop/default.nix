# hosts/desktop/default.nix
# Host configuration: imports hardware + nixos modules
{ config, lib, pkgs, ... }:

{
  imports = [
    # Hardware configuration from nixos-generate-config
    ./hardware-configuration.nix

    # System modules
    ../../modules/nixos/system/system.nix
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/system/users.nix
    ../../modules/nixos/system/fonts.nix

    # Networking
    ../../modules/nixos/networking
    ../../modules/nixos/networking/vpn.nix

    # Desktop modules
    ../../modules/nixos/desktop/display-manager.nix
    ../../modules/nixos/desktop/wayland-session.nix
    ../../modules/nixos/desktop/audio.nix
    ../../modules/nixos/desktop/file-manager.nix

    # Gaming modules (uncomment when needed)
    # ../../modules/nixos/gaming/steam.nix
    # ../../modules/nixos/gaming/wine.nix
    # ../../modules/nixos/gaming/performance.nix

    # Virtualization (uncomment when needed)
    # ../../modules/nixos/virt
  ];

  # Host-specific settings
  networking.hostName = "nixos-btw";
  boot.loader.grub.device = "/dev/vda";
  system.stateVersion = "25.11";
}
