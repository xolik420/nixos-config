{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home-manager/wofi.nix
    ../../home-manager/hyprpanel.nix
    ../../home-manager/hyprland.nix
    ../../home-manager/browsers.nix
  ];

  home.username = "tom";
  home.homeDirectory = "/home/tom";
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
    #    profileExtra = ''
    #         if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    #            exec hyprland
    #        fi
    #    '';
  };

  programs.ghostty.enable = true;

  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
    papirus-icon-theme
    yaru-theme
    arc-theme
    tokyonight-gtk-theme
    neovim
    wget
    git
    curl
    hyprpaper
    imv
    mpv
    fastfetch
    wofi
    mission-center
    htop
    wl-clipboard
    cliphist
    wl-clip-persist
    playerctl
    grim
    slurp
    swappy
    swww
    wf-recorder
    libnotify
    pavucontrol
    thunderbird


    # Fonts
    noto-fonts
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans

  ] ++ [
    (pkgs.hackneyed.overrideAttrs (oldAttrs: {
      makeFlags = oldAttrs.makeFlags ++ [ "DARK_THEME=1" ];
    }))
  ];

  home.pointerCursor = {
    name = "Hackneyed-Dark";
    # package = pkgs.posy-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;


    package = pkgs.hackneyed.overrideAttrs (oldAttrs: {
      makeFlags = oldAttrs.makeFlags ++ [ "DARK_THEME=1" ];
    });
  };


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

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Yaru-dark";
  };


  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
      templates = "${config.home.homeDirectory}/Templates";
      publicShare = "${config.home.homeDirectory}/Public";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "x-directory/normal" = "org.gnome.Nautilus.desktop";

        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "text/plain" = "nvim.desktop";

        # Images
        "image/jpeg" = "imv.dekstop";
        "image/png" = "imv.dekstop";
        "image/gif" = "imv.dekstop";
        "image/webp" = "imv.dekstop";
        "image/bmp" = "imv.dekstop";
        "image/svg+xml" = "imv.dekstop";

        # Videos
        "videos/mp4" = "mpv.desktop";
        "videos/x-matroska" = "mpv.desktop";
        "videos/webm" = "mpv.desktop";
        "videos/mpeg" = "mpv.desktop";
        "videos/x-msvideo" = "mpv.desktop";
        "videos/quicktime" = "mpv.desktop";

      };
    };

  };

  programs.home-manager.enable = true;

}	
