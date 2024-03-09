{pkgs, ...}: {
  users.users.retard = {
    isNormalUser = true;
    extraGroups = ["wheel" "network" "input" "video" "audio"];
    shell = pkgs.zsh;
  };
}
