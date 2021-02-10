{ config, pkgs, ... }:

{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
  };

  environment.systemPackages = with pkgs; [
    evince
    nixos.gnome3.file-roller
    gnome3.gnome-tweaks
    gnomeExtensions.dash-to-panel
  ];
}