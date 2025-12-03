# modules/home-manager/desktop/rofi.nix
# User Rofi config - Tokyo Night theme
{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # Use rofi-wayland if on Wayland, otherwise pkgs.rofi
    terminal = "ghostty";
    location = "center";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Windows";
      drun-display-format = "{name}";
      matching = "fuzzy";
      sort = true;
      sorting-method = "fzf";
    };

    theme =
      let
        inherit (builtins) toJSON;
      in
      builtins.toFile "tokyonight.rasi" ''
        * {
          bg: #1a1b26;
          bg-alt: #24283b;
          bg-selected: #364a82;
          fg: #c0caf5;
          fg-alt: #565f89;
          blue: #7aa2f7;

          border: 0;
          margin: 0;
          padding: 0;
          spacing: 0;
        }

        window {
          width: 600px;
          background-color: @bg;
          border: 2px solid;
          border-color: @bg-alt;
          border-radius: 10px;
        }

        mainbox {
          children: [inputbar, listview];
          background-color: @bg;
        }

        inputbar {
          children: [prompt, entry];
          background-color: @bg;
          padding: 10px;
        }

        prompt {
          enabled: false;
        }

        entry {
          background-color: @bg-alt;
          color: @fg;
          padding: 10px;
          border-radius: 5px;
          placeholder: "Search...";
          placeholder-color: @fg-alt;
        }

        listview {
          columns: 1;
          lines: 8;
          background-color: @bg;
          padding: 5px 10px;
        }

        element {
          children: [element-icon, element-text];
          padding: 8px;
          background-color: @bg;
          border-radius: 5px;
        }

        element-icon {
          size: 40px;
          padding: 0 10px 0 0;
          background-color: transparent;
        }

        element-text {
          background-color: transparent;
          color: @fg;
          vertical-align: 0.5;
        }

        element selected {
          background-color: @bg-selected;
        }

        element-text selected {
          color: @blue;
        }
      '';
  };
}
