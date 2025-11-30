# modules/home-manager/settings/home.nix
# HM stateVersion + HM-wide defaults
{ config, lib, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "ghostty";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
    # profileExtra = ''
    #   if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    #     exec hyprland
    #   fi
    # '';
  };

  programs.home-manager.enable = true;
}
