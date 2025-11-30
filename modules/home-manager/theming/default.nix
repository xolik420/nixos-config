# modules/home-manager/theming/default.nix
# GTK, Qt, cursor, dconf + theme packages
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Theme packages
    papirus-icon-theme
    yaru-theme
    arc-theme
    tokyonight-gtk-theme
  ] ++ [
    # Custom cursor theme
    (pkgs.hackneyed.overrideAttrs (oldAttrs: {
      makeFlags = oldAttrs.makeFlags ++ [ "DARK_THEME=1" ];
    }))
  ];

  # Cursor theme
  home.pointerCursor = {
    name = "Hackneyed-Dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.hackneyed.overrideAttrs (oldAttrs: {
      makeFlags = oldAttrs.makeFlags ++ [ "DARK_THEME=1" ];
    });
  };

  # GTK theming
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Qt theming
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Yaru-dark";
  };

  # dconf dark mode settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
