{ config, pkgs, ... }:
{
   home.packages = with pkgs; [
	  htop
	  firefox
	  wofi
	  vscodium
		neofetch
		sxiv
		pcmanfm
  ];
}