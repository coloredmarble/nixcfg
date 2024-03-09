{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    vscodium
    gcc
    pavucontrol
    xarchiver
    godot_4
    sxiv
    xarchiver
    telegram-desktop
  ];
}
