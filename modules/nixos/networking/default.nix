# modules/nixos/networking/default.nix
# Network manager and related tools
{ config, lib, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Network manager applet
  programs.nm-applet.enable = true;
}
