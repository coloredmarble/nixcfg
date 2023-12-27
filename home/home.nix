{ config, pkgs, ... }:

{
  imports = [
    ./table
    ./pkgs.nix
  ];
  home.username = "retard";
  home.homeDirectory = "/home/retard";

  home.stateVersion = "24.05"; 

  home.home-manager.enable = true;
}