{
  lib,
  pkgs,
  ...
}: {
  # table sounds cooler than desk
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      (nerdfonts.override {fonts = ["Monoid" "NerdFontsSymbolsOnly"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["Fira Code"];
      };
    };
  };
}
