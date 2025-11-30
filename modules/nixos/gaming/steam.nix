# modules/nixos/gaming/steam.nix
# Steam, gamemode, gamescope
{ config, lib, pkgs, ... }:

{
  # Uncomment when ready to use Steam
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  # };

  # programs.gamemode.enable = true;

  # environment.systemPackages = with pkgs; [
  #   gamescope
  # ];
}
