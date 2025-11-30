# modules/home-manager/browsers/chromium.nix
# Chromium HM settings
{ config, pkgs, lib, ... }:

{
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"
      "--ozone-platform=wayland"
    ];

    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
    ];
  };
}
