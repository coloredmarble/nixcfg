{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./fonts.nix
  ];
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # any programs with less than 6 lines of config? keep it here
  programs = {
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        plugins = ["git"];
        theme = "linuxonly";
      };
    };
    thunar.enable = true;
    xfconf.enable = true;
    hyprland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
