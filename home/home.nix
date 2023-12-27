{ config, pkgs, ... }:

{
  imports = [
    ./hypr.nix
    ./pkgs.nix
  ];
  home.username = "retard";
  home.homeDirectory = "/home/retard";

  home.stateVersion = "24.05"; 

  home.packages = with pkgs; [
	  htop
	  firefox
	  alacritty
	  wofi
	  vscodium
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs = {
		  home-manager.enable = true;
		  alacritty = {
			  enable = true;
		  };
      git = {
        enable = true;
        userName = "gitretard";
        userEmail = "znobbitcatspro@gmail.com";
      };
	};

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
      name = "Papirus";
    };

    font = {
      name = "Fira Code";
      size = 11;
    };
  };
}
