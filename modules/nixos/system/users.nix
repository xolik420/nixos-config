# modules/nixos/system/users.nix
# System users (tom, etc.)
{ config, lib, pkgs, ... }:

{
  users.users.tom = {
    isNormalUser = true;
    description = "tom";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      tree
    ];
  };
}
