{ config, pkgs, ... }:
{ 
  wayland.windowManager.hyprland = {	
		enable = true;
		xwayland.enable = true;
    settings = {
      "$mod" = "Alt";
      "$terminal" = "alacritty";
      bind = [
        "$mod, space, exec, $terminal"
        "$mod, Tab, exec, wofi --show drun --allow-images"
        "$mod, q, killactive"
        "$mod, p, exec, poweroff"
        "$mod, l, exec, reboot"
      ] ++ 
      (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      monitor = "HDMI-A-1,1920x1080@144,0x0,1";

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
      };

      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
          passes = 3;
          size = 10;
        };
      };

      animations = {
        enabled = true;
      # animation = [
        #  "border, 1, 2, default"
        #  "fade, 1, 4, default"
        #  "windows, 1, 3, default, popin 80%"
        #  "workspaces, 1, 2, default, slide"
      # ];
      };


    };
    # bindm later
		extraConfig = "
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
    ";
	};
}