{pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
		vim
		wget
		zsh
		polkit_gnome
  ];
}