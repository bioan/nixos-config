{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    valgrind
    #clang-11 #?! why is default clang obsolete
    cmake

    # qt5.full # wtf, requires compilation?!?
  ];
} 
