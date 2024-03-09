{
  config,
  libs,
  pkgs,
  ...
}: {
  imports = [
    ./gnome_polkit.nix
  ];
}
