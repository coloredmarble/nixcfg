{pkgs, ...}: {
  imports = [
    ./table
  ];

  home.packages = with pkgs; [
    discord
    firefox
    vscodium
    pavucontrol
    xarchiver
    sxiv
    xarchiver
    telegram-desktop
    alejandra
    pinta
    qemu
    obs-studio
  ];



  home.username = "retard";
  home.homeDirectory = "/home/retard";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
