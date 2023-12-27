{config, libs, pkgs, ...}:

{
  imports = [
    ./table
    ./units
    ./network.nix
    ./pkgs.nix
    ./security.nix
    ./services.nix
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