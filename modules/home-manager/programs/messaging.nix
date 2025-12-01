# modules/home-manager/programs/messaging.nix
# Messaging applications
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    signal-desktop
    telegram-desktop
  ];
}
