# modules/nixos/desktop/audio.nix
# PipeWire, rtkit, sound stack
{ config, lib, pkgs, ... }:

{
  # PipeWire audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Disable PulseAudio (using PipeWire instead)
  services.pulseaudio.enable = false;

  # Real-time audio scheduling
  security.rtkit.enable = true;
}
