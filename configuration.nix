# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./display/display.nix
    ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  # Specify the encrypted disk
  boot.initrd.luks.devices.root = {
    device = "/dev/nvme0n1p2"; 
    preLVM = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking setup
  networking.hostName = "johnnyb";
  
  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Root password
  users.users.root.initialHashedPassword = "$6$8sha.rBbQNnlw$DcAXByaNnUjuFE0D22wx7qseg78rLpyvt/foTSEk.X.LTADbZwLnnx1sI7SahkLrvkAWCQ1RHnSSXVC2AGgiH/";

  # Allow unfree proprietary packages such as spotify or vscode
  nixpkgs.config.allowUnfree = true;

  # Enabling unfree packages, adding unstable channel to be able to install latest packages as user
  environment.interactiveShellInit = ''
    if [ ! -f ~/.config/nixpkgs/config.nix ]
      then
        mkdir -p ~/.config/nixpkgs/
        echo  '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
    fi
  '';

  # List services that you want to enable:


  # Envvars
  environment.sessionVariables = {
    TERMINAL = [ "alacritty" ];  
    EDITOR = [ "vim" ];
  };
  
  # Limit journal size
  services.journald = {
    extraConfig = "SystemMaxUse=500M";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;

  # Enable BT
  hardware.bluetooth.enable = true;

  # Enable pulseaudio with BT support
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  # Font config
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "CascadiaCode" "FiraCode" "OpenDyslexic"]; })
  ];

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johnnyb = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/johnnyb/";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  # TODO: settings for fish, alacritty, etc.

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?
 
}
