# modules/nixos/desktop/file-manager.nix
# File manager and related services
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    gvfs
  ];

  # gvfs service for file manager
  services.gvfs.enable = true;
}
