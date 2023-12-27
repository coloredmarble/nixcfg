{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/4C40-4781";
      fsType = "vfat";
    };
  fileSystems."/" =
    { device = "/dev/nvme0n1p2";
      fsType = "btrfs";
    };
  boot.loader.efi.efiSysMountPoint = "/efi";
  swapDevices = [ ];
	hardware = {
		opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.package = pkgs.mesa.drivers;
    cpu.intel.updateMicrocode = true;
	};
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp0s20f0u6u4.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
