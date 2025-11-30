# modules/home-manager/xdg/default.nix
# XDG user dirs, MIME apps, xdg utilities
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
  ];

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
}
