{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  users.users.retard = {
    isNormalUser = true;
    extraGroups = ["wheel" "network" "input" "video" "audio"];
  };
}
