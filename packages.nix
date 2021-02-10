{ pkgs, ... }:
{
  imports =
    [ # Packages with configuration, or multiple requirements should be separated into their own files
      ./bundles/latex.nix
      ./bundles/languages.nix
    ];
  # System-wide packages - only include must-haves here
  environment.systemPackages = with pkgs; [ 
    # System utilities
    usbutils
    unzip
    vim
    wget
    git

    # Rusty replacements
    alacritty
    broot
    exa # ls replacement
    ytop # (h)top replacement
    bat #cat replacement
    fd #find replacement
    procs # ps replacement
    du-dust # du replacement (original name is dust)
    #ripgrep # grep replacement
    #ripgrep-all # ripgrep but for many file types?
    starship # Prompt replacement
    hyperfine # benchmarker
    tealdeer # tldr manpages
    bandwhich # network utilization
    #grex # create regex from string
    zoxide # cd replacement
    nushell # shell replacement
    # uutils-coreutils
    
    # Browsers
    firefox-devedition-bin
    
    # Chat clients:
    # signal-desktop
    tdesktop

    # Misc
    thunderbird
  ];

  programs.fish.enable = true;

  # configure alacritty
  # programs.alacritty = {
  #   enable = true;
  #   brightBold = true;
  #   font = {
  #     normal.family = "JetBrainsMono NerdFont";
  #     size = "8.0";
  #   };
  # };
}
