{
  config,
  pkgs,
  rootPath,
  ...
}: {
  imports = [
    ./table
    ./pkgs.nix
  ];
  home.username = "retard";
  home.homeDirectory = "/home/retard";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
