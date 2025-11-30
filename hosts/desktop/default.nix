# hosts/desktop/default.nix
# Host configuration: imports hardware + nixos modules
{ config, lib, pkgs, ... }:

{
  imports = [
    # Hardware configuration from nixos-generate-config
    ./hardware-configuration.nix

    # System modules
    ../../modules/nixos/system/system.nix
    ../../modules/nixos/system/users.nix
    ../../modules/nixos/system/fonts.nix

    # Desktop modules
    ../../modules/nixos/desktop/display-manager.nix
    ../../modules/nixos/desktop/wayland-session.nix
    ../../modules/nixos/desktop/audio.nix

    # Gaming modules (uncomment when needed)
    # ../../modules/nixos/gaming/steam.nix
    # ../../modules/nixos/gaming/wine.nix
    # ../../modules/nixos/gaming/performance.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 8;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hostname
  networking.hostName = "nixos-btw";

  # Enable networking
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # System packages (host-specific)
  environment.systemPackages = with pkgs; [
    ghostty
    mullvad-vpn
    omnissa-horizon-client
    gvfs
    nautilus
  ] ++ [
    (pkgs.hackneyed.overrideAttrs (oldAttrs: {
      makeFlags = oldAttrs.makeFlags ++ [ "DARK_THEME=1" ];
    }))
  ];

  # gvfs service for file manager
  services.gvfs.enable = true;

  # Polkit authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "25.11";
}
