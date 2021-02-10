#!/bin/sh
sudo cp -r * /etc/nixos/
sudo nixos-rebuild switch
echo "Do you wish to reboot now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) exit;;
    esac
done
