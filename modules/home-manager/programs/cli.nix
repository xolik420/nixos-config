# modules/home-manager/programs/cli.nix
# Command-line tools and utilities
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # System monitoring
    htop
    fastfetch

    # Network tools
    wget
    curl
    nmap

    # Version control
    git

    # Notifications
    libnotify

    # Text editor
    neovim
  ];
}
