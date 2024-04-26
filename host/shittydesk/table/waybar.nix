{rootPath, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ("${rootPath}" + "/stuff/waybarStyle.txt");
    settings = [
      {
        layer = "top";
        position = "bottom";
        modules-left = [
          "hyprland/mode"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-right = [
          "custom/arrow6"
          "pulseaudio"
          "custom/arrow5"
          "custom/arrow4"
          "custom/arrow3"
          "custom/arrow2"
          "hyprland/language"
          "custom/arrow1"
          "tray"
          "clock#date"
          "custom/arrow0"
          "clock#time"
        ];

        "clock#time" = {
          interval = 1;
          format = "{:%H%M}";
          tooltip = false;
        };

        "clock#date" = {
          interval = 10;
          format = "{:%e %b %y}";
          tooltip = false;
        };
        "hyprland/language" = {
          format = "{}";
          min-length = 5;
          tooltip = false;
        };
        pulseaudio = {
          format = "vol {volume}% {format_source}";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        network = {
          interval = 1;
          format-alt = "{essid} ({signalStrength}%)";
          format-disconnected = "balls";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
          format-linked = "{ifname} (No balls) ";
          format-wifi = "{ifname}: {ipaddr}/{cidr}";
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        "custom/arrow0" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow1" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow2" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow3" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow4" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow5" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow6" = {
          format = "";
          tooltip = false;
        };
      }
    ];
  };
}
