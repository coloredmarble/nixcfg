# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./table.nix
      ./pkgs.nix
      ./users.nix
    ];

  networking.hostName = "retard";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Set your time zone
  	time = {
		timeZone = "Asia/Bangkok";
	};

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  security.polkit.enable = true; 
  security.rtkit.enable = true;
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  services = {
	  pipewire = {
		  enable = true;	
		  alsa.enable = true;
		  pulse.enable = true;
      wireplumber.enable = true;
	  };
    gvfs.enable = true;
    tumbler.enable = true;
};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  system.stateVersion = "unstable";

}

