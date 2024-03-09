{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # for nix formatting
    alejandra
    tree
    vim
    wget
    zsh
    polkit_gnome
    unzip
    unrar
  ];
}
