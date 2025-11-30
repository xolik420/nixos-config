# modules/home-manager/programs/mail.nix
# Email client
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
  ];
}
