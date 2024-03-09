{ config, lib, pkgs, ... }:

{
  imports = [
    ./units
    ./fonts.nix
    ./services.nix
  ];

  networking.hostName = "retard";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";

  programs.dconf.enable = true;
  
  sound.enable = true;
  users.users.retard = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" "input" "video" "audio"];
  };

  environment.systemPackages = with pkgs; [
     vim 
     wget
     git
  ];

  programs = {
    zsh = {
      enable = true;
        ohMyZsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "lambda";
      };
    };
    xfconf.enable = true;
    hyprland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  system.stateVersion = "unstable";
  

}

