# modules/home-manager/programs/utilities.nix
# CLI utilities and system tools
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # System monitoring
    htop
    fastfetch
    mission-center

    # Notifications
    libnotify

    # Network/download tools
    wget
    curl
    git

    # Text editor
    neovim
  ];
}
