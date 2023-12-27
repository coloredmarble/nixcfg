#!/bin/bash
sudo cp -r ~/nixcfg/nix/* /etc/nixos
# dont know how to use flakes yet
sudo cp -r ~/nixcfg/host/shittydesk/* /etc/nixos
cp -r ~/nixcfg/home/* ~/.config/home-manager
# sudo nix-collect-garbage -d
sudo nixos-rebuild switch
home-manager switch
