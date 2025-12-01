# modules/home-manager/browsers/mullvad.nix
# Mullvad Browser - privacy-focused browser based on Firefox
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    mullvad-browser
  ];
}
