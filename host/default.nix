{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    # change according to host
    ./shittydesk.nix
  ];
}