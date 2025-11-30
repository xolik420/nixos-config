# modules/nixos/gaming/wine.nix
# wine/winetricks, Lutris, Heroic, etc.
{ config, lib, pkgs, ... }:

{
  # Uncomment when ready to use Wine and game launchers
  # environment.systemPackages = with pkgs; [
  #   wine
  #   winetricks
  #   lutris
  #   heroic
  # ];
}
