# modules/home-manager/programs/media.nix
# Media players and audio control
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Video player
    mpv

    # Image viewer
    imv

    # Media control
    playerctl

    # Audio control GUI
    pavucontrol
  ];
}
