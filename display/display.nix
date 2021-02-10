{ config, pkgs, ... }:

{
  imports = [
      # ./gnome.nix
      ./plasma.nix
      # ./i3wm.nix
      # ./leftwm.nix
    ];

  services.xserver = {
    enable = true;
    # displayManager.defaultSession = "none+i3";

    layout = "us";
    xkbOptions = "eurosign:e";

    # Necessary to enable touchpad, it seems? - middle mouse button isn't working?
    # libinput.enable = false;
    # synaptics.enable = true;
    libinput.enable = true;
  };
}
