# modules/nixos/networking/vpn.nix
# VPN clients
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];

  # Mullvad VPN service
  services.mullvad-vpn.enable = true;
}
