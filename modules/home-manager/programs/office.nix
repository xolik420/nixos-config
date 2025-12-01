# modules/home-manager/programs/office.nix
# Office suite
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
  ];
}
