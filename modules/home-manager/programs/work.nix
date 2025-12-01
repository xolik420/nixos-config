# modules/home-manager/programs/work.nix
# Work-related applications
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    omnissa-horizon-client
    jdk  # for ScreenConnect
  ];
}
