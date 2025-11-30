# modules/nixos/desktop/display-manager.nix
# SDDM + login screen
{ config, lib, pkgs, ... }:

{
  # SDDM display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      sddm-astronaut
    ];

    settings = {
      Theme = {
        CursorTheme = "Hackneyed-Dark";
        CursorSize = 24;
      };
    };
  };

  # SDDM theme packages
  environment.systemPackages = with pkgs; [
    sddm-astronaut
    kdePackages.qtmultimedia
  ];
}
