{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        tweaks = [ "black" ];
        variant = "macchiato";
      };
      name = "Catppuccin-Macchiato-Standard-Lavender-Dark";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Fira Code";
      size = 11;
    };
  };
 
}