{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    htop
    wofi
    neofetch
  ];
}
