# modules/nixos/virt/default.nix
# Virtualization with QEMU/KVM and virt-manager
{ config, lib, pkgs, ... }:

{
  # Enable libvirtd
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };

  # Enable spice USB redirection
  virtualisation.spiceUSBRedirection.enable = true;

  # Virt-manager GUI
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    qemu
    virt-viewer
    spice-gtk
  ];
}
