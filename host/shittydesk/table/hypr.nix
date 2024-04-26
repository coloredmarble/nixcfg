{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    swww
    wofi
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "Alt";
      "$terminal" = "kitty";

      exec-once = [
        "swww init && swww img ~/nixcfg/stuff/wall/wallhaven-34xkv0.jpg"
      ];

      bind =
        [
          "$mod, space, exec, $terminal"
          "$mod, Tab, exec, wofi --show drun --allow-images"
          "$mod, q, killactive"
          "$mod, p, exec, poweroff"
          "$mod, l, exec, reboot"
          "$mod, k, exec, hyprctl dispatch exit"
          "$mod, w, exec, waybar"
          "$mod, s, togglefloating"
        ]
        ++ (
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
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      monitor = "HDMI-A-1,1920x1080@144,0x0,1";

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
      };

      decoration = {
        rounding = 10;
      };

      animations = {
        enabled = true;
      };
    };
    # bindmw
  };
}
