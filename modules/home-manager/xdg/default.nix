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
        "image/jpeg" = "imv.desktop";
        "image/png" = "imv.desktop";
        "image/gif" = "imv.desktop";
        "image/webp" = "imv.desktop";
        "image/bmp" = "imv.desktop";
        "image/svg+xml" = "imv.desktop";

        # Videos
        "video/mp4" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/x-msvideo" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";

        # Audio
        "audio/mpeg" = "mpv.desktop";
        "audio/flac" = "mpv.desktop";
        "audio/ogg" = "mpv.desktop";
        "audio/wav" = "mpv.desktop";

        # PDF
        "application/pdf" = "firefox.desktop";
      };
    };
  };
}
