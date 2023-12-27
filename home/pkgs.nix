{ config, pkgs, ... }:
{
   home.packages = with pkgs; [
	  htop
	  firefox
	  alacritty
	  wofi
	  vscodium
		neofetch
  ];
}