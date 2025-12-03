# modules/nixos/system/users.nix
# System users (tom, etc.)
{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  users.users.tom = {
    isNormalUser = true;
    description = "tom";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    packages = with pkgs; [
      tree
    ];
  };
}
