# modules/home-manager/desktop/wayland-tools.nix
# Wayland clipboard, screenshot, recording, wallpaper tools
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Clipboard
    wl-clipboard
    cliphist
    wl-clip-persist

    # Screenshot and recording
    grim
    slurp
    swappy
    wf-recorder

    # Wallpaper
    hyprpaper
    swww
  ];
}
