{ config, lib, pkgs, modulesPath, ... }:

{
  # who knows whats in this fucking file
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  boot = {
  # I FUCKING HATE NIX DOCUMENTAION
  #  kernelPackages = pkgs.linuxPackages;
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

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
