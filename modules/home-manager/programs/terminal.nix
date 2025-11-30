# modules/home-manager/programs/terminal.nix
# Terminal emulator configuration
{ config, lib, pkgs, ... }:

{
  programs.ghostty.enable = true;
}
