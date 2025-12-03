# home/tom/default.nix
# Imports modules/home-manager/* for user tom
{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Settings and defaults
    ../../modules/home-manager/settings/home.nix

    # Theming (GTK, Qt, cursor, icons)
    ../../modules/home-manager/theming

    # XDG directories and MIME
    ../../modules/home-manager/xdg

    # Desktop environment
    ../../modules/home-manager/desktop/hyprland.nix
    ../../modules/home-manager/desktop/hyprpanel.nix
    ../../modules/home-manager/desktop/rofi.nix
    ../../modules/home-manager/desktop/wayland-tools.nix

    # Browsers
    ../../modules/home-manager/browsers/firefox.nix
    ../../modules/home-manager/browsers/chromium.nix
    ../../modules/home-manager/browsers/mullvad.nix

    # Programs
    ../../modules/home-manager/programs/shell.nix
    ../../modules/home-manager/programs/terminal.nix
    ../../modules/home-manager/programs/cli.nix
    ../../modules/home-manager/programs/utilities.nix
    ../../modules/home-manager/programs/media.nix
    ../../modules/home-manager/programs/mail.nix
    ../../modules/home-manager/programs/messaging.nix
    ../../modules/home-manager/programs/office.nix
    ../../modules/home-manager/programs/work.nix
    ../../modules/home-manager/programs/neovim.nix

    # PWAs
    ../../pwas/teams.nix
    ../../pwas/wvd.nix
    ../../pwas/3cx.nix
  ];

  # User-specific settings
  home.username = "tom";
  home.homeDirectory = "/home/tom";
}
