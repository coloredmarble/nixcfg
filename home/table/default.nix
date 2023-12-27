{ config, pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./hypr.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
  # any programs with less than 5 lines of config? keep it here
  programs = {
		  alacritty = {
			  enable = true;
		  };
      git = {
        enable = true;
        userName = "gitretard";
        userEmail = "znobbitcatspro@gmail.com";
      };
	};
}