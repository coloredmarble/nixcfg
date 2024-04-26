{config, lib, pkgs, ... }:

{
  imports = [
    ./units
    ./fonts.nix
    ./services.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  
  networking.hostName = "retard";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";


  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    htop
    neofetch
    ncdu
    tmux
    clang
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
          enable = true;
          plugins = [ "git"];
          theme = "lambda";
      };
    };
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  system.stateVersion = "unstable";

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    flags = [
      "--recreate-lock-file"
      "--no-write-lock-file"
      "-L"
    ];
    dates = "daily";
  };
  nix.settings.auto-optimise-store = true;
}
  

