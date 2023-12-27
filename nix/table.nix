{ config, lib, pkgs, ... }:
{
  # table sounds cooler than desk
  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
      font = "Lat2-Terminus16";
      keyMap = lib.mkDefault "us";
      useXkbConfig = true; # use xkb.options in tty.
  };


  fonts = {
    enableDefaultPackages = true;
		packages = with pkgs; [
  			noto-fonts
  			noto-fonts-cjk
  			noto-fonts-emoji
  			liberation_ttf
  			fira-code
  			fira-code-symbols
  			mplus-outline-fonts.githubRelease
  			dina-font
  			proggyfonts
		];
		fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Fira Code" ];
      };
    };
	};

  programs = {
    zsh = {
      enable = true;
        ohMyZsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "linuxonly";
      };
    };
    xfconf.enable = true;
    thunar.enable = true;
  };
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  programs.hyprland.enable = true;
}