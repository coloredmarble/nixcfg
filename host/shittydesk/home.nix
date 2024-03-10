{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    vscodium
    gcc
    pavucontrol
    xarchiver
    sxiv
    xarchiver
    telegram-desktop
  ];
}
