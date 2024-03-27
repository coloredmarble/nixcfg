{
  config,
  pkgs,
  rootPath,
  ...
}: {
  imports = [
    ./kitty.nix
    ./gtk.nix
    ./hypr.nix
    ./waybar.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
  # any programs with less than 5 lines of config? keep it here
  programs = {
    git = {
      enable = true;
      userName = "coloredmarble";
      userEmail = "retardedmf@proton.me";
    };
  };
}
