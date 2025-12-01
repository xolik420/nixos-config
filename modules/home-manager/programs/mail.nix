# modules/home-manager/programs/mail.nix
# Email clients and tools
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    protonmail-bridge
  ];
}
