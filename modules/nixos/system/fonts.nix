# modules/nixos/system/fonts.nix
# System-wide fonts
{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Noto fonts
    noto-fonts
    noto-fonts-color-emoji

    # Liberation fonts (metric-compatible with Arial, Times, Courier)
    liberation_ttf

    # Fira Code (monospace with ligatures)
    fira-code
    fira-code-symbols

    # Nerd Fonts (patched fonts with icons)
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans
  ];
}
