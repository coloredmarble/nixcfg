{pkgs, ...}: {
  imports = [
    ./table
  ];

  home.packages = with pkgs; [
    discord
    firefox
    vscodium
    gcc
    pavucontrol
    xarchiver
    sxiv
    xarchiver
    telegram-desktop
    alejandra
  ];



  home.username = "retard";
  home.homeDirectory = "/home/retard";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
