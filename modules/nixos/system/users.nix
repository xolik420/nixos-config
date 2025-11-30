# modules/nixos/system/users.nix
# System users (tom, etc.)
{ config, lib, pkgs, ... }:

{
  users.users.tom = {
    isNormalUser = true;
    description = "tom";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
}
