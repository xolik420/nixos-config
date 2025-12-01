# modules/home-manager/programs/utilities.nix
# GUI utilities and tools
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # System monitoring GUI
    mission-center

    # Settings/configuration
    dconf-editor

    # Privacy
    metadata-cleaner
    bitwarden-desktop
  ];
}
