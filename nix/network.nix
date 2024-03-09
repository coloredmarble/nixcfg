{
  networking.hostName = "retard";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  networking.dhcpcd.wait = "if-carrier-up";
  systemd.services.NetworkManager-wait-online.enable = false;
}
