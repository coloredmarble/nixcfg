{ config, lib, pkgs, modulesPath, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "amdgpu"];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/4C40-4781";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/nvme0n1p2";
      fsType = "btrfs";
    };

  boot.loader.efi.efiSysMountPoint = "/efi";

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s20f0u3.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # i dual boot with win
  time.hardwareClockInLocalTime = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.enableRedistributableFirmware = lib.mkDefault true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault true;

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };

  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];


  programs = {
    dconf.enable = true;
    xfconf.enable = true;
    hyprland.enable = true;
  };
  
  sound.enable = true;
  
  users.users.retard = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" "input" "video" "audio"];
    shell = pkgs.zsh;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
