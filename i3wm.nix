{ config, pkgs, ... }:

{
services.xserver = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+i3";
    };
    
    desktopManager = {
      xterm.enable = false;
    };

    windowManager.bspwm = {
      enable = true;
    };
    
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3status
        i3lock
      ];
    };
  };
}