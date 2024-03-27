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
          "custom/arrow10"
          "hyprland/window"
        ];
        modules-right = [
          "custom/arrow9"
          "pulseaudio"
          "custom/arrow8"
          "network"
          "custom/arrow7"
          "memory"
          "custom/arrow6"
          "cpu"
          "custom/arrow5"
          "temperature"
          "custom/arrow4"
          "custom/arrow3"
          "hyprland/language"
          "custom/arrow2"
          "tray"
          "clock#date"
          "custom/arrow1"
          "clock#time"
        ];

        "clock#time" = {
          interval = 1;
          format = "{:%H:%M:%S}";
          tooltip = false;
        };

        "clock#date" = {
          interval = 10;
          format = "{:%e %b %Y}";
          tooltip = false;
        };
        cpu = {
          interval = 1;
          tooltip = true;
          format = " {usage}%";
          format-alt = " {load}";
          states = {
            warning = 70;
            critical = 90;
          };
        };
        "hyprland/language" = {
          format = " {}";
          min-length = 5;
          tooltip = false;
        };
        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = ["" "" ""];
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        network = {
          interval = 1;
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "balls";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
          format-linked = "{ifname} (No IP) ";
          format-wifi = "{essid} ({signalStrength}%)";
        };
        memory = {format = "{}% ";};
        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "hyprland/mode" = {
          format = "{}";
        };
        tray = {
          icon-size = 18;
          spacing = 10;
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
        "custom/arrow7" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow8" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow9" = {
          format = "";
          tooltip = false;
        };
        "custom/arrow10" = {
          format = "";
          tooltip = false;
        };
      }
    ];
  };
}
