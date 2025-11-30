# modules/home-manager/desktop/hyprpanel.nix
# User Hyprpanel config
{ config, lib, pkgs, ... }:

let
  themeFile = "${pkgs.hyprpanel}/share/themes/catppuccin_mocha.json";
  themeSettings = builtins.fromJSON (builtins.readFile themeFile);
in
{
  programs.hyprpanel = {
    enable = true;
    settings = themeSettings // {
      "theme.bar.menus.monochrome" = false;
      "wallpaper.pywal" = false;
      "bar.launcher.autoDetectIcon" = true;

      "theme.font.size" = "0.9rem";
      "theme.font.name" = "CaskaydiaMono Nerd Font Mono";
      "theme.font.label" = "CaskaydiaMono Nerd Font Mono";

      "theme.bar.buttons.padding_y" = "0.2rem";
      "theme.bar.buttons.padding_x" = "0.8rem";
      "theme.bar.outer_spacing" = "0.2rem";
      "theme.bar.buttons.dashboard.enableBorder" = false;
      "theme.bar.buttons.workspaces.enableBorder" = false;
      "theme.bar.buttons.windowtitle.enableBorder" = false;

      "theme.bar.buttons.separator.width" = "0.1em";

      # Workspaces
      "bar.workspaces.show_icons" = true;
      "bar.workspaces.show_numbered" = false;
      "bar.workspaces.workspaceMask" = false;
      "bar.workspaces.showWsIcons" = false;
      "bar.workspaces.showApplicationIcons" = false;
      "bar.workspaces.applicationIconOncePerWorkspace" = true;
      "bar.workspaces.spacing" = 1.3;
      "bar.workspaces.workspaces" = 6;
      "bar.workspaces.showAllActive" = true;
      "bar.workspaces.monitorSpecific" = false;
      "theme.bar.buttons.workspaces.smartHighlight" = true;

      # Layouts (same on all monitors)
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "clock" "notifications" ];
          right = [ "media" "volume" "network" "bluetooth" "systray" ];
        };
        "1" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "clock" "notifications" ];
          right = [ "media" "volume" "network" "bluetooth" "systray" ];
        };
        "2" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "clock" "notifications" ];
          right = [ "media" "volume" "network" "bluetooth" "systray" ];
        };
      };

      # Window title
      "bar.windowtitle.truncation" = true;
      "bar.windowtitle.icon" = true;
      "bar.windowtitle.label" = true;
      "bar.windowtitle.class_name" = true;
      "bar.windowtitle.custom_title" = true;
      "theme.bar.buttons.windowtitle.spacing" = "1em";

      "bar.windowtitle.title_map" = [
        [ "firefox" "󰈹" "Firefox" ]
      ];

      # Clock menu
      "menus.clock.time.military" = true;
      "menus.clock.time.hideSeconds" = false;
      "menus.clock.weather.location" = "Zagreb";
      "menus.clock.weather.unit" = "metric";
      "menus.clock.weather.key" = "";

      "bar.clock.showIcon" = true;
      "bar.clock.showTime" = true;
      "bar.clock.format" = "%b %d  %H:%M";
      "theme.bar.buttons.clock.spacing" = "0.8em";

      # Dashboard shortcuts
      "menus.dashboard.shortcuts.left.shortcut1.icon" = "";
      "menus.dashboard.shortcuts.left.shortcut1.command" = "firefox";
      "menus.dashboard.shortcuts.left.shortcut1.tooltip" = "Firefox";

      "menus.dashboard.shortcuts.left.shortcut2.icon" = "󰝚";
      "menus.dashboard.shortcuts.left.shortcut3.icon" = "";

      "menus.dashboard.shortcuts.left.shortcut4.command" = "wofi --show drun";

      "menus.dashboard.powermenu.avatar.image" = "~/.face.icon";

      # Media module spacing
      "theme.bar.buttons.media.spacing" = "0.9em";

      # Audio menu
      "bar.volume.rightClick" = "${pkgs.pavucontrol}/bin/pavucontrol";

      # Scaling (important on Wayland with mixed DPI)
      scalingPriority = "gdk";
    };
  };

  home.file.".config/hyprpanel/modules.scss".text = ''
    .bar_item_box_visible.dashboard {
      padding: 0 1rem 0 0.6rem;
    }
  '';
}
