{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Probably highly unnecessary, and can be reduced. Just can't be bothered atm
    texlive.combined.scheme-full
    # (texlive.combine { inherit (texlive) scheme-basic latexmk exam; })
    # (texlive.combine { inherit (texlive) scheme-medium xifthen ifmtarg framed paralist titlesec; })
  ];
} 
