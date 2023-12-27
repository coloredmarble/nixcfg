{config, lib, pkgs, ...}:

{
  imports = [
    ./table
    ./units
    ./network.nix
    ./pkgs.nix
    ./security.nix
    ./services
  ];
  users.defaultUserShell = pkgs.zsh;
  users.users.retard = {
     isNormalUser = true;
     extraGroups = [ "wheel" "network" "input" "video" "audio"];
  };
  time = {
		timeZone = "Asia/Bangkok";
	};
  system.stateVersion = "unstable";
}