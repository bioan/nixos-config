{ config, pkgs, ... }:

{
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  environment.systemPackages = with pkgs; [
    okular
    krita
    ark
    kate
    kdenlive
  ];
}