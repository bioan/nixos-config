{}:
{
  # https://nixos.wiki/wiki/Sway
  # https://www.reddit.com/r/NixOS/comments/g77n4m/run_sway_on_startup/

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako # notification daemon
      wofi
    ];
  };

  environment.systemPackages = with pkgs; [ brightnessctl ];
  users.users.yourusername.extraGroups = [ "video" ];
  # or
  # programs.light.enable = true;
  # environment.systemPackages = with pkgs; [ pactl ];

  # Clipboard support
  environment.systemPackages = with pkgs; [ wl-clipboard ];

#   nixpkgs.overlays = [
#   (self: super: {
#     wl-clipboard-x11 = super.stdenv.mkDerivation rec {
#     pname = "wl-clipboard-x11";
#     version = "5";
  
#     src = super.fetchFromGitHub {
#       owner = "brunelli";
#       repo = "wl-clipboard-x11";
#       rev = "v${version}";
#       sha256 = "1y7jv7rps0sdzmm859wn2l8q4pg2x35smcrm7mbfxn5vrga0bslb";
#     };
  
#     dontBuild = true;
#     dontConfigure = true;
#     propagatedBuildInputs = [ super.wl-clipboard ];
#     makeFlags = [ "PREFIX=$(out)" ];
#     };
  
#     xsel = self.wl-clipboard-x11;
#     xclip = self.wl-clipboard-x11;
#   })
# ];

}