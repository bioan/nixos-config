{ config, pkgs, ... }:

{
  imports = [
    ./tiling-common.nix
  ];

  services.xserver = {
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3lock
        polybar # Note - apparently without i3support, needs override?
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    
  ];
}