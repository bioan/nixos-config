{ config, pkgs, ... }:

{
  imports = [
    ./tiling-common.nix
  ];

  services.xserver = {
    windowManager.leftwm = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    
  ];
}
