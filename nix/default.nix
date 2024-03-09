{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./table
    ./units
    ./network.nix
    ./pkgs.nix
    ./security.nix
    ./services
    ./users.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time = {
    timeZone = "Asia/Bangkok";
  };
  system.stateVersion = "unstable";
}
